package main



/**


1.chan 创建在堆中，返回指针
2. 使用循环队列作为缓冲区
3. 每次操作都要加锁，并更新操作（send 或 recv 的index)
4. 缓冲区满，进入等待队列，并让出m。等待被唤醒
5. 被唤醒后，重新加入g 队列
 */

