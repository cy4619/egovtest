package test;

class Page implements Comparable<Page> {
    String name;
    int order;
    Page parent;
    String key;

    Page() {
        name = "root";
        order  = 0;
        parent = null;
        key    = "";
    }

    Page(String name, int order, Page parent) {
        this.name   = name;
        this.order  = order;
        this.parent = parent;
        key = parent.key + (char)order;
    }

    @Override
    public int compareTo(Page o) {
        return key.compareTo(o.key);
    }

    @Override
    public String toString() {
        return name;
    }
}