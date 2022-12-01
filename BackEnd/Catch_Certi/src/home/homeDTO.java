package home;
import java.sql.*;
import java.util.*;
public class homeDTO {

    private int Num;
    private String cp_name;
    private String work_link;
    private String cp_logo;
    private String work_name;
    private String skill;
    private String intro_work;
    private String preview;
    private String cp_preview;

    public int getNum() {
        return Num;
    }

    public String getCp_name() {
        return cp_name;
    }

    public String getWork_link() {
        return work_link;
    }

    public String getCp_logo() {
        return cp_logo;
    }

    public String getWork_name() {
        return work_name;
    }

    public String getSkill() {
        return skill;
    }

    public String getIntro_work() {
        return intro_work;
    }

    public String getPreview() {
        return preview;
    }

    public String getCp_preview() {
        return cp_preview;
    }

    public void setNum(int num) {
        Num = num;
    }

    public void setCp_name(String cp_name) {
        this.cp_name = cp_name;
    }

    public void setWork_link(String work_link) {
        this.work_link = work_link;
    }

    public void setCp_logo(String cp_logo) {
        this.cp_logo = cp_logo;
    }

    public void setWork_name(String work_name) {
        this.work_name = work_name;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public void setIntro_work(String intro_work) {
        this.intro_work = intro_work;
    }

    public void setPreview(String preview) {
        this.preview = preview;
    }

    public void setCp_preview(String cp_preview) {
        this.cp_preview = cp_preview;
    }
}
