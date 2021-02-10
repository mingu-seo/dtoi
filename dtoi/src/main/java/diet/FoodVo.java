package diet;

public class FoodVo {

	private int fd_no;
	private String name;
	private int calories;
	private float carbohydrate;
	private float fiber;
	private float protein;
	private float fat;
	private float sodium;
	private float sugar;
	private int gdegree;
	private int foodCount;
	
	FoodVo(){
		gdegree = 100;
	}
	public int getFd_no() {
		return fd_no;
	}
	public void setFd_no(int fd_no) {
		this.fd_no = fd_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCalories() {
		return calories;
	}
	public void setCalories(int calories) {
		this.calories = calories;
	}
	public float getCarbohydrate() {
		return carbohydrate;
	}
	public void setCarbohydrate(float carbohydrate) {
		this.carbohydrate = carbohydrate;
	}
	public float getFiber() {
		return fiber;
	}
	public void setFiber(float fiber) {
		this.fiber = fiber;
	}
	public float getProtein() {
		return protein;
	}
	public void setProtein(float protein) {
		this.protein = protein;
	}
	public float getFat() {
		return fat;
	}
	public void setFat(float fat) {
		this.fat = fat;
	}
	public float getSodium() {
		return sodium;
	}
	public void setSodium(float sodium) {
		this.sodium = sodium;
	}
	public float getSugar() {
		return sugar;
	}
	public void setSugar(float sugar) {
		this.sugar = sugar;
	}
	public int getGdegree() {
		return gdegree;
	}
	public void setGdegree(int gdegree) {
		this.gdegree = gdegree;
	}
	public int getFoodCount() {
		return foodCount;
	}
	public void setFoodCount(int foodCount) {
		this.foodCount = foodCount;
	}
}
