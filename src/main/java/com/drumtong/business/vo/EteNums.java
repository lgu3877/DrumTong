package com.drumtong.business.vo;

// ete, count, amount
public class EteNums {
	private int ete;
	private int count;
	private int amount;
	public int getEte() {
		return ete;
	}
	public void setEte(int ete) {
		this.ete = ete;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return this.getEte() + ", " + this.getCount() + ", " + this.getAmount() + "\n";
	}
}
