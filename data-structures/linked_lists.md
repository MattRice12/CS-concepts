1. Can be used to implement Stack, Queue’s, Tress, Graphs efficiently. (and there are plenty of used of all these)
  * In general any place you want LIFO (Last In, First Out) (stack) or FIFO (First In, First Out) (queue) behavior


2. Dynamic memory allocation -- LL are used when size of data is not fixed and we want to efficiently utilize our memory space
  * For ex, if you have data worth 1.5 GB and you cannot get that much contiguous space in your computer, but you can get at most 0.5 GB of contiguous memory chunk, you can divide the data into 3 parts and then store the location of first chunk somewhere, store the location of second chunk in first chunk, location of third chunk in second chunk and so on.   



3. When random element deletion/insertion is required in constant time.
  * In case of fixed DS like array, need to re-shift position of all remaining element--this shift is an O(n) operation. In case of Linked list, inserting/deleting just requires reassignment of the adjacent pointers. You don't have to touch all of the remaining elements in the list.
  * Big O Time Complexity:
      * Arrays:       O(n)
      * Linked Lists: O(1)


4. Dynamic Data structure. (i.e size can easily be increased)


Examples of application:
  * The cache in browser. (allows you to hit back and fwd links URL’s through linked list)
  * Image viewer! (next and previous button. the next and previous images are linked there
  * Undo functionality in photo editors, text editors. (a linked list of different states)


Each node Consist of two Parts--viz. Data Part & Pointer Part
