package com.jk1603.vivo.user.pojo;


public class Order {
	private Integer id;
	private User user;
	private Goods goods;
	private Integer goodsquantity;
	private String state;
	private Boolean ischecked;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGoodsquantity() {
		return goodsquantity;
	}
	public void setGoodsquantity(Integer goodsquantity) {
		this.goodsquantity = goodsquantity;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Boolean getIschecked() {
		return ischecked;
	}
	public void setIschecked(Boolean ischecked) {
		this.ischecked = ischecked;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	

}
