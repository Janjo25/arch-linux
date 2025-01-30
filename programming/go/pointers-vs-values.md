# **📌 Definitive Guide: Pointer (`*`) vs Value in Go**

When in doubt about whether to use a pointer or a value in Go, the following questions can help make the decision:

### **1️⃣ Is it an EXTERNAL resource?**

If the value interacts with something **outside the program** (e.g., databases, files, network sockets), a **pointer**
should be used.

🔹 **Examples of external resources (require a pointer)**:

```go
*pgxpool.Pool   // PostgreSQL connection pool.
*os.File        // Open file in the system.
*websocket.Conn // WebSocket connection.
```

---

### **2️⃣ Is it a SHARED resource?**

If multiple parts of the code use the same value, and duplicating it would cause problems or resource waste, a **pointer
** is the right choice.

🔹 **Examples of shared resources (require a pointer)**:

```go
*sync.Mutex  // Shared lock for synchronization.
*http.Client // Reusable HTTP client.
```

---

### **3️⃣ Is it a LARGE structure and expensive to copy?**

If the value contains a lot of data and copying it frequently would impact performance, a **pointer** is more efficient.

🔹 **Example of a large structure (requires a pointer)**:

```go
type BigData struct {
	Data [1024]int // Large array.
}
```

If this structure were passed by value, **Go would copy all 1024 integers each time** a function is called. In this
case, a pointer is more efficient.

---

### **4️⃣ Does it need to be MODIFIED inside a function?**

If the value needs to change inside a function and the changes should be visible outside, a **pointer** is necessary.

🔹 **Example:**

```go
func Modify(x *int) {
	*x += 1
}

var number = 10
Modify(&number) // ✅ Now number = 11
```

Without a pointer, the function would modify **a copy**, leaving the original value unchanged.

---

### **5️⃣ Is it small and immutable? (SAFE CASE FOR COPY)**

If the structure is lightweight and doesn’t need modifications, **a copy is safer and more efficient**.

🔹 **Examples of values that can be passed by copy**:

```go
int, float64, string // Primitive types are cheap to copy.
time.Time            // Already optimized for copying.
websocket.Upgrader   // Only configures, doesn’t maintain state.
```

💡 **Example of a lightweight structure that does NOT need a pointer:**

```go
type Config struct {
	Port    int
	Timeout time.Duration
}

func PrintConfig(cfg Config) {
	fmt.Println(cfg.Port, cfg.Timeout)
}
```

Here, `Config` is small and doesn’t change inside the function, so **copying it is safe**.

---

## **🔎 Quick Summary**

| Question                                        | Answer | Solution             |
|-------------------------------------------------|--------|----------------------|
| Is it an external resource (DB, network, file)? | ✅ Yes  | 🔹 **Pointer (`*`)** |
| Is it shared across multiple parts of the code? | ✅ Yes  | 🔹 **Pointer (`*`)** |
| Is it a large structure and expensive to copy?  | ✅ Yes  | 🔹 **Pointer (`*`)** |
| Does it need to be modified inside a function?  | ✅ Yes  | 🔹 **Pointer (`*`)** |
| Is it small, immutable, and cheap to copy?      | ✅ Yes  | 🔹 **Value (copy)**  |

---

## **🔥 Final Conclusion**

✅ **Use a pointer (`*`) if the value is an EXTERNAL, SHARED, or LARGE resource.**  
✅ **Use a copy if the value is SMALL and does not need modification.**  
✅ **Whenever in doubt, check the table and key questions.**
