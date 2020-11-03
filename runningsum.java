package day1;


import java.util.*;
public class runningsum {

	public static void main(String[] args) {
		int sum=0;
		int[] nums= {1,2,3,4,};
		int[] result = new int[nums.length];
		for(int i=0;i<nums.length;i++) {
			sum+=nums[i];
			result[i]=sum;
		}
	
		System.out.println(Arrays.toString(result));	
	}

}
