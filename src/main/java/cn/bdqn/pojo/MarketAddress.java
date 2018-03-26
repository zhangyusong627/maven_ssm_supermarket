package cn.bdqn.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class MarketAddress {
    private BigDecimal idno;

    private String contact;

    private String addressdesc;

    private String postcode;

    private String tel;

    private BigDecimal createdby;

    private Date creationdate;

    private BigDecimal modifyby;

    private Date modifydate;

    private BigDecimal userid;

    public BigDecimal getIdno() {
        return idno;
    }

    public void setIdno(BigDecimal idno) {
        this.idno = idno;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
    }

    public String getAddressdesc() {
        return addressdesc;
    }

    public void setAddressdesc(String addressdesc) {
        this.addressdesc = addressdesc == null ? null : addressdesc.trim();
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public BigDecimal getCreatedby() {
        return createdby;
    }

    public void setCreatedby(BigDecimal createdby) {
        this.createdby = createdby;
    }

    public Date getCreationdate() {
        return creationdate;
    }

    public void setCreationdate(Date creationdate) {
        this.creationdate = creationdate;
    }

    public BigDecimal getModifyby() {
        return modifyby;
    }

    public void setModifyby(BigDecimal modifyby) {
        this.modifyby = modifyby;
    }

    public Date getModifydate() {
        return modifydate;
    }

    public void setModifydate(Date modifydate) {
        this.modifydate = modifydate;
    }

    public BigDecimal getUserid() {
        return userid;
    }

    public void setUserid(BigDecimal userid) {
        this.userid = userid;
    }
}