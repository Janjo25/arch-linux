# Goroutines in Go

Goroutines are a way to execute functions **concurrently** in Go. They are lightweight **user-space threads** managed by
the Go runtime, making them more efficient and lightweight than traditional OS threads.

---

## **Starting a Goroutine**

To start a goroutine, use the `go` keyword before calling a function:

```go
go myFunction()
```

This launches `myFunction` as a separate concurrent execution.

---

## **Why Are Goroutines Not Threads?**

Although they behave similarly, goroutines **are not OS threads**. The key differences:

1. **Managed by the Go runtime:**
    - The **Go scheduler** maps multiple goroutines onto a limited number of OS threads.
    - Uses a **M:N model** (M goroutines run on N OS threads).

2. **Lighter than OS threads:**
    - A goroutine starts with just a few KB of memory, whereas OS threads require MBs.
    - The runtime dynamically adjusts the goroutine stack size, while OS threads have a fixed stack size.

3. **Faster context switching:**
    - The Go runtime handles context switching within user space, avoiding expensive OS-level thread context switches.

4. **Visual Analogy:**
    - OS threads are like **heavy trucks** (expensive, slow to start).
    - Goroutines are like **bicycles** (lightweight, fast, efficient). 🚲 vs. 🚛

---

## **Advantages of Goroutines Over Traditional Threads**

- **Ease of use**: No need for complex threading libraries.
- **Scalability**: Can handle thousands of goroutines efficiently.
- **Automatic management**: The Go runtime handles scheduling and optimization.

---

## **Goroutines and Channels**

Goroutines are often used with **channels** (`chan`) to communicate safely and avoid race conditions. Channels allow
goroutines to synchronize and pass data without explicit locking mechanisms.

---

## **Potential Pitfalls**

1. **Goroutine leaks**: If a goroutine is waiting indefinitely, it can cause memory leaks.
2. **Data races**: Multiple goroutines accessing shared variables can lead to race conditions.
3. **Deadlocks**: Occur when goroutines are waiting on each other indefinitely.
