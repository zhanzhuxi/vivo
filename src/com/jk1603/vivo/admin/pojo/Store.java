package com.jk1603.vivo.admin.pojo;

public class Store {
	private Integer id;
	private Goods goods;
	private int goodsquantity;
	private String goodsstate;
	private Boolean ischecked;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public int getGoodsquantity() {
		return goodsquantity;
	}
	public void setGoodsquantity(int goodsquantity) {
		this.goodsquantity = goodsquantity;
	}
	public String getGoodsstate() {
		return goodsstate;
	}
	public void setGoodsstate(String goodsstate) {
		this.goodsstate = goodsstate;
	}
	public Boolean getIschecked() {
		return ischecked;
	}
	public void setIschecked(Boolean ischecked) {
		this.ischecked = ischecked;
	}
}
