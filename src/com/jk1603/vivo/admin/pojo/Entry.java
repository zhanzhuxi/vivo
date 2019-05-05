package com.jk1603.vivo.admin.pojo;

public class Entry {
	private Integer id;
	private Goods goods;
	private int goodsquantity;
//	private BigDecimal goodsPrice;
//	private Date entryTime;
	private Admin admin;
	private String state;
	private Boolean ischecked;
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
//	public BigDecimal getGoodsPrice() {
//		return goodsPrice;
//	}
//	public void setGoodsPrice(BigDecimal goodsPrice) {
//		this.goodsPrice = goodsPrice;
//	}
//	public Date getEntryTime() {
//		return entryTime;
//	}
//	public void setEntryTime(Date entryTime) {
//		this.entryTime = entryTime;
//	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getGoodsquantity() {
		return goodsquantity;
	}
	public void setGoodsquantity(int goodsquantity) {
		this.goodsquantity = goodsquantity;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Boolean getIschecked() {
		return ischecked;
	}
	public void setIschecked(Boolean ischecked) {
		this.ischecked = ischecked;
	}
	
}
