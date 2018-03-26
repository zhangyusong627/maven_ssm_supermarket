package cn.bdqn.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class MarketRole {
    private BigDecimal idno;

    private String rolecode;

    private String rolename;

    private BigDecimal createdby;

    private Date creationdate;

    private BigDecimal modifyby;

    private Date modifydate;

    public BigDecimal getIdno() {
        return idno;
    }

    public void setIdno(BigDecimal idno) {
        this.idno = idno;
    }

    public String getRolecode() {
        return rolecode;
    }

    public void setRolecode(String rolecode) {
        this.rolecode = rolecode == null ? null : rolecode.trim();
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
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
}