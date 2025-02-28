package dto;

public class ClassDTO {
	private int no;
	private UserDTO creator;
	private String cover_img;
	private String title;
	private String detail_category;
	private String content;
	private String material_img;
	private String material_content;
	private int expiration;
	private int tuition;
	private CategoryDTO category;
	private BuyerDTO buyer;

	public ClassDTO() {
	}

	public ClassDTO(int no, UserDTO creator, String cover_img, String title, String detail_category, String content,
			String material_img, String material_content, int expiration, int tuition, CategoryDTO category,
			BuyerDTO buyer) {
		super();
		this.no = no;
		this.creator = creator;
		this.cover_img = cover_img;
		this.title = title;
		this.detail_category = detail_category;
		this.content = content;
		this.material_img = material_img;
		this.material_content = material_content;
		this.expiration = expiration;
		this.tuition = tuition;
		this.category = category;
		this.buyer = buyer;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public UserDTO getCreator() {
		return creator;
	}

	public void setCreator(UserDTO creator) {
		this.creator = creator;
	}

	public String getCover_img() {
		return cover_img;
	}

	public void setCover_img(String cover_img) {
		this.cover_img = cover_img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail_category() {
		return detail_category;
	}

	public void setDetail_category(String detail_category) {
		this.detail_category = detail_category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMaterial_img() {
		return material_img;
	}

	public void setMaterial_img(String material_img) {
		this.material_img = material_img;
	}

	public String getMaterial_content() {
		return material_content;
	}

	public void setMaterial_content(String material_content) {
		this.material_content = material_content;
	}

	public int getExpiration() {
		return expiration;
	}

	public void setExpiration(int expiration) {
		this.expiration = expiration;
	}

	public int getTuition() {
		return tuition;
	}

	public void setTuition(int tuition) {
		this.tuition = tuition;
	}

	public CategoryDTO getCategory() {
		return category;
	}

	public void setCategory(CategoryDTO category) {
		this.category = category;
	}

	public BuyerDTO getBuyer() {
		return buyer;
	}

	public void setBuyer(BuyerDTO buyer) {
		this.buyer = buyer;
	}

}