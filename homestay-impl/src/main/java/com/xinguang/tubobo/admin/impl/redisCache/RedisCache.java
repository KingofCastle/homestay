/**
 * Copyright &copy; 2012-2013 <a href="http://www.hzmux.com">hzmux</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.xinguang.tubobo.admin.impl.redisCache;

import com.hzmux.hzcms.common.utils.ObjectByteConvert;
import org.springframework.cache.Cache;
import org.springframework.cache.support.SimpleValueWrapper;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.Set;

public class RedisCache implements Cache{

	public static final String TUBOBO_CACHE = "tubobo_cache";

	private RedisTemplate<String, Object> redisTemplate;
	private String name;
	private long liveTime;

	public long getLiveTime() {
		return liveTime;
	}

	public void setLiveTime(long liveTime) {
		this.liveTime = liveTime;
	}

	public RedisTemplate<String, Object> getRedisTemplate() {
		return redisTemplate;
	}

	public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
		this.redisTemplate = redisTemplate;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return this.name;
	}

	@Override
	public Object getNativeCache() {
		// TODO Auto-generated method stub
		return this.redisTemplate;
	}

	@Override
	public ValueWrapper get(Object key) {
		if (key == null ) return null;
		// TODO Auto-generated method stub
		final String keyf =  key.toString();
		Object object;
		object = redisTemplate.execute(new RedisCallback<Object>() {
			public Object doInRedis(RedisConnection connection)
					throws DataAccessException {
				byte[] key = keyf.getBytes();
				byte[] value = connection.get(key);
				if (value == null) {
					return null;
				}
				return ObjectByteConvert.ByteToObject(value);
			}
		});
		return (object != null ? new SimpleValueWrapper(object) : null);
	}

	@Override
	public void put(Object key, Object value) {
		if (key == null || value == null) return;
		// TODO Auto-generated method stub
		final String keyf = key.toString();
		final Object valuef = value;

		redisTemplate.execute(new RedisCallback<Long>() {
			public Long doInRedis(RedisConnection connection)
					throws DataAccessException {
				byte[] keyb = keyf.getBytes();
				byte[] valueb = toByteArray(valuef);
				connection.set(keyb, valueb);
				if (liveTime > 0) {
					connection.expire(keyb, liveTime);
				}
				return 1L;
			}
		});
	}

	private byte[] toByteArray(Object obj) {
		byte[] bytes = null;
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		try {
			ObjectOutputStream oos = new ObjectOutputStream(bos);
			oos.writeObject(obj);
			oos.flush();
			bytes = bos.toByteArray();
			oos.close();
			bos.close();
		}catch (IOException ex) {
			ex.printStackTrace();
		}
		return bytes;
	}

	@Override
	public void evict(Object key) {
		// TODO Auto-generated method stub

		final String keyf = key.toString();
		redisTemplate.execute(new RedisCallback<Long>() {
			public Long doInRedis(RedisConnection connection)
					throws DataAccessException {
				Set<byte[]> keyset = connection.keys(keyf.getBytes());
				for (byte[] keyd: keyset){
					connection.del(keyd);
				}
				return 0l;
			}
		});
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		redisTemplate.execute(new RedisCallback<String>() {
			public String doInRedis(RedisConnection connection)
					throws DataAccessException {
				connection.flushDb();
				return "ok";
			}
		});
	}

	@Override
	public <T> T get(Object key, Class<T> type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ValueWrapper putIfAbsent(Object key, Object value) {
		// TODO Auto-generated method stub
		return null;
	}



}
