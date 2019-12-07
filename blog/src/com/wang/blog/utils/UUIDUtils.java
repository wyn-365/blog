package com.wang.blog.utils;

import java.util.Random;
import java.util.UUID;

public class UUIDUtils {
	
	public  static int getNum(){    
		int max=10000,min=1;
		         long randomNum = System.currentTimeMillis();  
		         int ran3 = (int) (randomNum%(max-min)+min);  
		        System.out.println(ran3);
				return ran3;
		}
		
	
	
	/*
	 * 随机生成id
	 */
	public static String getId(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	//64位
	public static String getUUID64(){
		return getId()+getId();
	}
	
	/**
	 * 生成随机码
	 * @return
	 */
	public static String getCode(){
		return getId();
	}
	
	public static void main(String[] args) {
		System.out.println(getId());
		
		/*
		 * String str = UUID.randomUUID().toString(); System.out.println(str);
		 */
	}
	

	
}
