package cn.bdqn.pojo;

import java.util.List;

public class Page<T> {

    private int currentPage;
    private int pageSize =3;
    private int totalCount;
    private int totalPage;
    private int start;
    private T t;

    private List<T> list;

  

    @Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", totalCount=" + totalCount + ", totalPage=" + totalPage
				+ ", start=" + start + ", t=" + t + ", list=" + list + "]";
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public T getT() {
        return t;
    }

    public void setT(T t) {
        this.t = t;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;

    }

    public int getTotalPage() {
        return totalPage;
    }

}
