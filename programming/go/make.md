## `make` Function in Go

In Go, the `make` function is used to initialize and allocate memory for certain built-in data structures that require
special setup before use. These structures include:

1. **Slices (`[]T`)**
2. **Maps (`map[K]V`)**
3. **Channels (`chan T`)**

Unlike `new`, which only allocates memory and returns a pointer, `make` properly initializes these structures so they
are ready to use.

---

### **How to Use `make`?**

The syntax of `make` is:

```go
make(type, [size], [capacity])
```

- **`type`**: Specifies the type of structure to initialize (slice, map, or channel).
- **`size`** (optional for slices): Specifies the initial number of elements in the structure.
- **`capacity`** (optional for slices): Defines the total capacity, useful for optimizing dynamic growth.

---

### **Using `make` with Slices**

When using `make` to create a slice, both size and capacity can be specified:

```go
s := make([]int, 5, 10)
fmt.Println(len(s)) // Output: 5
fmt.Println(cap(s)) // Output: 10
```

- The slice `s` is initialized with **5 elements**, but it has a **capacity of 10**, meaning it can grow without
  immediate reallocation.

---

### **Using `make` with Maps**

Maps do not require a size argument, but specifying one can optimize performance:

```go
m := make(map[string]int)
m["key"] = 42
fmt.Println(m["key"]) // Output: 42
```

- The map is properly initialized and ready for key-value assignments.

---

### **Using `make` with Channels**

Channels created with `make` can be **buffered** (with capacity) or **unbuffered**:

```go
ch := make(chan int, 3) // Buffered channel with capacity 3.
ch <- 1
ch <- 2
ch <- 3
fmt.Println(<-ch) // Output: 1
```

- The buffer allows three values to be stored before blocking occurs.

---

### **Why Use `make` Instead of `new`?**

| Function | Purpose                                                  | Example                     |
|----------|----------------------------------------------------------|-----------------------------|
| `make`   | Initializes slices, maps, or channels                    | `make([]int, 5)`            |
| `new`    | Allocates memory for any type but does not initialize it | `new(int)` (returns `*int`) |

- `make` ensures the structure is fully initialized and ready for use, whereas `new` simply allocates memory.
