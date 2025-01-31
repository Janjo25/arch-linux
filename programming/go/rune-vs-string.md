# `rune` vs `string` in Go

In Go, `rune` and `string` are both used to represent characters, but they serve different purposes. Understanding when
to use each type is crucial for writing efficient and clear code.

---

## **🔹 When to Use `rune`?**

`rune` is appropriate when working with **single characters** or when character manipulation is required.

### **✅ Best Use Cases for `rune`**

1. **Handling a single character:**
   ```go
   var letter rune = 'A'
   fmt.Printf("Character: %c, Unicode: %U\n", letter, letter)
   ```
    - `letter` holds a single Unicode character ('A').
    - The `%U` format prints the Unicode code point (`U+0041`).

2. **Processing Unicode characters:**
   ```go
   emoji := '😊'
   fmt.Printf("Emoji: %c, Unicode: %U\n", emoji, emoji)
   ```
    - `rune` ensures proper handling of Unicode characters.

3. **Iterating over characters in a string:**
   ```go
   text := "Hola, 🌍"
   for i, r := range text {
       fmt.Printf("Index %d: %c (Unicode: %U)\n", i, r, r)
   }
   ```
    - `range` converts each character into a `rune`, ensuring correct processing of multi-byte characters.

4. **Performing arithmetic on characters:**
   ```go
   letter := 'A'
   nextLetter := letter + 3 // 'D'.
   fmt.Printf("Next Letter: %c\n", nextLetter)
   ```
    - Useful for letter-based computations, such as encoding algorithms.

---

## **🔹 When to Use `string`?**

`string` is more appropriate for **words, labels, identifiers, or textual data.**

### **✅ Best Use Cases for `string`**

1. **Storing labels or names:**
   ```go
   location := "Kitchen"
   if location == "Kitchen" {
       fmt.Println("You are in the kitchen!")
   }
   ```
    - `string` is preferred when handling meaningful names instead of single characters.

2. **Comparing or searching for words:**
   ```go
   text := "Hello, world!"
   if strings.Contains(text, "world") {
       fmt.Println("Found 'world'!")
   }
   ```
    - `string` allows easy searching and text manipulation.

3. **Mapping identifiers to values:**
   ```go
   rooms := map[string]string{
       "A": "Living Room",
       "B": "Kitchen",
   }
   fmt.Println("Room B is:", rooms["B"])
   ```
    - Using `string` as keys makes lookups easier.

4. **Reading input and handling text dynamically:**
   ```go
   var userInput string
   fmt.Scanln(&userInput)
   fmt.Println("User said:", userInput)
   ```
    - Strings are ideal for handling user input or text files.

---

## **🛑 When NOT to Use Each Type?**

| ❌ Incorrect           | ✅ Correct                  |
|-----------------------|----------------------------|
| `rune name = 'John'`  | `string name = "John"`     |
| `string letter = "A"` | `rune letter = 'A'`        |
| `rune city = 'NY'`    | `string city = "New York"` |
| `rune status = 'OK'`  | `string status = "OK"`     |

---

## **🚀 Quick Cheat Sheet: When to Use `rune` vs `string`**

| Scenario             | Use `rune` | Use `string` |
|----------------------|------------|--------------|
| Single character     | ✅          | ❌            |
| Unicode processing   | ✅          | ❌            |
| Character arithmetic | ✅          | ❌            |
| Label or identifier  | ❌          | ✅            |
| Sentences or words   | ❌          | ✅            |
| User input           | ❌          | ✅            |

---

## **🔎 Final Verdict**

- **`rune` is suitable for single-character handling, Unicode, or character arithmetic.**
- **`string` is preferable for labels, words, or textual data.**
- **If uncertain, consider whether the value represents a single character or a meaningful word.**

---
