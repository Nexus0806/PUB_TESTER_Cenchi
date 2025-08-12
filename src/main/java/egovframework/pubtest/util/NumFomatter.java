package egovframework.pubtest.util;

import com.ibm.icu.text.DecimalFormat;

public class NumFomatter {
	public static String rewardFommatter(String campRewardStr) {
        long amount = Long.parseLong(campRewardStr);
        DecimalFormat df = new DecimalFormat("#,###");
		String campFomattedReward = df.format(amount);
		return campFomattedReward;
	}
}
