package cn.bdqn.pojo;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MarketBill {
    private Integer idno; //订单ID

    private String billcode;//订单编号

    private String productname;//商品名称

    private String productdesc;//商品描述

    private String productunit;//商品单位

    private Integer productcount;//商品数量

    private double totalprice;//商品总额

    private Integer ispayment;//是否支付

    private Integer createdby;//创建者

    private Date creationdate;//创建日期

    private Integer modifyby;//更新者

   
    private Date modifydate; //更新时间

    private Integer providerid;//供应商ID
    
    private String providerName;

    private String  createDate;
    

    
    
    
    public String getProviderName() {
        return providerName;
    }

    
    public void setProviderName(String providerName) {
        this.providerName = providerName;
    }

    
    public String getCreateDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
        return format.format(this.creationdate);
    }

    
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public Integer getIdno() {
        return idno;
    }

    public void setIdno(Integer idno) {
        this.idno = idno;
    }

 

    
    public String getBillcode() {
        return billcode;
    }


    public void setBillcode(String billcode) {
        this.billcode = billcode == null ? null : billcode.trim();
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname == null ? null : productname.trim();
    }

    public String getProductdesc() {
        return productdesc;
    }

    public void setProductdesc(String productdesc) {
        this.productdesc = productdesc == null ? null : productdesc.trim();
    }

    public String getProductunit() {
        return productunit;
    }

    public void setProductunit(String productunit) {
        this.productunit = productunit == null ? null : productunit.trim();
    }

    public Integer getProductcount() {
        return productcount;
    }

    public void setProductcount(Integer productcount) {
        this.productcount = productcount;
    }

    

    
   

    
    public double getTotalprice() {
        return totalprice;
    }


    
    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }


    public Integer getIspayment() {
        return ispayment;
    }

    public void setIspayment(Integer ispayment) {
        this.ispayment = ispayment;
    }

    public Integer getCreatedby() {
        return createdby;
    }

    public void setCreatedby(Integer createdby) {
        this.createdby = createdby;
    }

    public Date getCreationdate() {
        return creationdate;
    }

    public void setCreationdate(Date creationdate) {
        this.creationdate = creationdate;
    }

    public Integer getModifyby() {
        return modifyby;
    }

    public void setModifyby(Integer modifyby) {
        this.modifyby = modifyby;
    }

    public Date getModifydate() {
        return modifydate;
    }

    public void setModifydate(Date modifydate) {
        this.modifydate = modifydate;
    }

    public Integer getProviderid() {
        return providerid;
    }

    public void setProviderid(Integer providerid) {
        this.providerid = providerid;
    }



    @Override
    public String toString() {
        return "MarketBill [idno=" + idno + ", billcode=" + billcode + ", productname=" + productname
                + ", productdesc=" + productdesc + ", productunit=" + productunit + ", productcount=" + productcount
                + ", totalprice=" + totalprice + ", ispayment=" + ispayment + ", createdby=" + createdby
                + ", creationdate=" + creationdate + ", modifyby=" + modifyby + ", modifydate=" + modifydate
                + ", providerid=" + providerid  + " ]";
    }

  
    
    
    
}