package com.easset.dao;

import java.util.*;

import com.easset.model.Asset;
import com.easset.model.AssetType;

public interface AssetDao {
    public int addAsset(String name,int typeId,String desc);
    public List<Asset> getAssets();
    public List<Asset> getAssetsById(int id);
    public String allocateAsset(int userId,int assetId);
    public List<String> getPopularAssets();
    public List<AssetType> getTypes();
    public int deAllocateAsset(int id);
    public List<Asset> getAvailableAssets();
}
