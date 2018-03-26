package cn.bdqn.pojo;

import java.util.Date;
public class MarketUser {
    private Integer idno;

    private String usercode;

    private String username;

    private String userpassword;

    private Integer gender;

    private Date birthday;

    private Long phone;

    private String address;

    private Integer userrole;

    private Integer createdby;

    private Date creationdate;

    private Integer modifyby;

    private Date modifydate;
    
    
    private int age;
    
    

    public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Integer getIdno() {
        return idno;
    }

    public void setIdno(Integer idno) {
        this.idno = idno;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode == null ? null : usercode.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword == null ? null : userpassword.trim();
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getUserrole() {
        return userrole;
    }

    public void setUserrole(Integer userrole) {
        this.userrole = userrole;
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

	@Override
	public String toString() {
		return "MarketUser [idno=" + idno + ", usercode=" + usercode
				+ ", username=" + username + ", userpassword=" + userpassword
				+ ", gender=" + gender + ", birthday=" + birthday + ", phone="
				+ phone + ", address=" + address + ", userrole=" + userrole
				+ ", createdby=" + createdby + ", creationdate=" + creationdate
				+ ", modifyby=" + modifyby + ", modifydate=" + modifydate
				+ ", age=" + age + "]";
	}

     

   
}