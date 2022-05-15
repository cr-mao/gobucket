package main

// 逃逸分析 ; go在编译阶段确定内存是分配在栈还是堆上的一种行为

//栈内存分配和释放很快、
//堆内存需要依靠go 垃圾回收(占cpu）
//通过逃逸分析，可以尽量把拿些不需要分配在堆上的变量 直接分配到栈上

// go build  -gcflags=-m   018内存逃逸分析.go

//1 函数的变量 作为返回值被返回
// 参数为interface 类型的，   也可能会发生逃逸  ，如果能确定类型 请指定类型

// 一些Newxxx 函数返回   结构体，还是指针，  如果 返回的其他地方不用的。 那就返回结构体（可以减少一次逃逸） ,否则返回指针

func test() []int {
	a := []int{1, 2, 3}
	a[1] = 4
	return a //有return 发生逃逸，没有则不发生
}
func main() {
	test()
}
