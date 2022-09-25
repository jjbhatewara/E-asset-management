package com.easset.dao;
import java.sql.*;
import java.util.*;

import com.easset.model.Asset;
import com.easset.model.AssetType;


public class AssetDaoImpl implements AssetDao {
    Connection conn = null;
	Statement stmt = null;
    PreparedStatement pstmt=null;
    
    public List<Asset> getAvailableAssets() {
    	List<Asset> assets = new ArrayList<>() ;
        Map<Integer,String> types = new HashMap<>();
        String sql1 = "SELECT * FROM asset_type";
        String sql2 = "SELECT * from asset a where a.isAvailable = 1";
        try {
			
            ResultSet rs = stmt.executeQuery(sql1);
            while(rs.next()){
                types.put(rs.getInt(1), rs.getString(2));
            }
            rs = stmt.executeQuery(sql2);
            while(rs.next()){
                int assetId = rs.getInt(3);
                assets.add(new Asset(rs.getInt(1), rs.getString(2), new AssetType(assetId, types.get(assetId)), rs.getString(4), rs.getString(5), rs.getBoolean(6)));
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}

        return assets;
	}
    
    public int deAllocateAsset(int id) {
    	int i =0;
		String sql = "DELETE FROM allocation WHERE `allocation`.`assed_id` = ?";
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			i = pstmt.executeUpdate();
			System.out.println(i + "LINE 21");
			sql = "UPDATE `asset` SET `isAvailable` = '1' WHERE `asset`.`id` = ?;";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			i = i+ pstmt.executeUpdate();
			System.out.println(i + "LINE 26");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
    
    public List<String> getPopularAssets() {
        List<String> popAssets = new ArrayList<>() ;
        String sql = "SELECT ba.Name as count FROM allocation a join asset ba on ba.id = a.assed_id GROUP BY a.assed_id  ORDER BY count DESC LIMIT 5;";
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                popAssets.add(rs.getString(1));
            }
        } catch (SQLException e) {        
            e.printStackTrace();
        }
        return popAssets;
    }
    
    public int addAsset(String name,int typeId,String desc) {
        String sql = "INSERT INTO `asset`(`Name`, `type`, `Description`, `isAvailable`) VALUES (?,?,?,1)";
        int i =0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setInt(2, typeId);
            pstmt.setString(3,desc);
            i = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public List<Asset> getAssets(){
        List<Asset> assets = new ArrayList<>() ;
        Map<Integer,String> types = new HashMap<>();
        String sql1 = "SELECT * FROM asset_type";
        String sql2 = "SELECT * FROM asset";
        try {
			
            ResultSet rs = stmt.executeQuery(sql1);
            while(rs.next()){
                types.put(rs.getInt(1), rs.getString(2));
            }
            rs = stmt.executeQuery(sql2);
            while(rs.next()){
                int assetId = rs.getInt(3);
                assets.add(new Asset(rs.getInt(1), rs.getString(2), new AssetType(assetId, types.get(assetId)), rs.getString(4), rs.getString(5), rs.getBoolean(6)));
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}

        return assets;
    }

    public List<Asset> getAssetsById(int id){
        List<Asset> assets = new ArrayList<>() ;
        Map<Integer,String> types = new HashMap<>();
        String sql1 = "SELECT * FROM asset_type";
        String sql2 = "SELECT * from asset WHERE asset.id IN (SELECT a.assed_id FROM allocation a WHERE a.user_id = ?);";
        try {			
            ResultSet rs = stmt.executeQuery(sql1);
            while(rs.next()){
                types.put(rs.getInt(1), rs.getString(2));
            }            
            pstmt = conn.prepareStatement(sql2);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while(rs.next()){
                int assetId = rs.getInt(3);
                assets.add(new Asset(rs.getInt(1), rs.getString(2), new AssetType(assetId, types.get(assetId)), rs.getString(4), rs.getString(5), rs.getBoolean(6)));
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return assets;
    }



    public String allocateAsset(int userId,int assetId) {
        String msg = "ERROR";
        String sql = "SELECT a.type from asset a WHERE a.id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, assetId);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            int type = rs.getInt(1);
            sql = "SELECT b.type from asset b WHERE b.id IN (SELECT a.assed_id from allocation a WHERE a.user_id =? ); ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                if( rs.getInt(1) == type ){
                    return "User has taken item of same type";
                }
            }
            sql = "INSERT INTO `allocation`(`user_id`, `assed_id`) VALUES (?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(2, assetId);
            pstmt.setInt(1, userId);
            if( pstmt.executeUpdate() != 0 ){
                msg = "Asset Successfully Allocated";
                sql = "UPDATE `asset` SET `isAvailable` = '0' WHERE `asset`.`id` = ?;";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, assetId);
                pstmt.executeUpdate();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return msg;
    }


    public List<AssetType> getTypes() {
    	List<AssetType> at = new ArrayList<AssetType>();
    	String sql = "SELECT * FROM asset_type";
    	ResultSet rs;
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()){
	            at.add(new AssetType(rs.getInt(1),rs.getString(2)));
	        } 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
          
    	return at;
	}

    public AssetDaoImpl() {
        conn = DBConnection.getConnection();
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }    

    // public static void main(String[] args) {
    //     AssetType att = new AssetType(1, "Laptop");
    //     Asset a = new Asset(2 , "Asus", att ,"OK ok","20/01/20", true);
    //     System.out.println( new AssetDaoImpl().allocateAsset(2,3));
    // }

}
