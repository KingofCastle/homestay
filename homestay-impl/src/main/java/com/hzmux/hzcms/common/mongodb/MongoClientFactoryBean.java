package com.hzmux.hzcms.common.mongodb;

import com.mongodb.*;
import org.springframework.beans.factory.config.AbstractFactoryBean;

import java.util.ArrayList;
import java.util.List;

public class MongoClientFactoryBean extends AbstractFactoryBean<MongoClient> {

    private String[] serverStrings;
    private int milliseconds;
    private List<MongoCredential> mongoCredentials;

    @Override
    public Class<?> getObjectType() {
        // TODO Auto-generated method stub
        return MongoClient.class;
    }

    @Override
    protected MongoClient createInstance() throws Exception {
        MongoClient client = initMongoClient();
        return client;
    }

    private MongoClient initMongoClient() throws Exception {
        MongoClient client;
        List<ServerAddress> serverList = getServerList();

        List<MongoCredential> credentialsList = mongoCredentials==null?new ArrayList<MongoCredential>():mongoCredentials;

        MongoClientOptions mongoOptions = MongoClientOptions.builder()
                .maxConnectionIdleTime(milliseconds)
                .readPreference(ReadPreference.secondaryPreferred())
                .writeConcern(WriteConcern.ACKNOWLEDGED)
                .build();

        if(serverList.size()==0) {
            client = new MongoClient();
        } else if(serverList.size()==1) {
            client = new MongoClient(serverList.get(0),credentialsList, mongoOptions);
        } else {
            client = new MongoClient(serverList,credentialsList, mongoOptions);
        }
        return client;
    }

    private List<ServerAddress> getServerList() throws Exception {
        List<ServerAddress> list = new ArrayList<>();
        try{
            for (String serverStr : serverStrings) {
                String[] temp = serverStr.split(":");
                String host = temp[0];
                if(temp.length>2) {
                    throw new IllegalArgumentException("Invalid server address string: " + serverStr);
                } else if(temp.length==2) {
                    list.add(new ServerAddress(host, Integer.valueOf(temp[1])));
                } else {
                    list.add(new ServerAddress(host));
                }
            }
        } catch(Exception e) {
            throw new Exception("Error while converting serverString to ServerAddressList", e);
        }
        return list;
    }

    public String[] getServerStrings() {
        return serverStrings;
    }

    public void setServerStrings(String[] serverStrings) {
        this.serverStrings = serverStrings;
    }

    public List<MongoCredential> getMongoCredentials() {
        return mongoCredentials;
    }

    public void setMongoCredentials(List<MongoCredential> mongoCredentials) {
        this.mongoCredentials = mongoCredentials;
    }

    public int getMilliseconds() {
        return milliseconds;
    }

    public void setMilliseconds(int milliseconds) {
        this.milliseconds = milliseconds;
    }

}
