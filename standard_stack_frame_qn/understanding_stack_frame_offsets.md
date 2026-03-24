**Stack Frame Offsets — Why `[rbp]`, `[rbp+8]`, `[rbp-8]`?**

* `call f` pushes the **return address** onto the stack.
* `push rbp` then pushes the **caller’s old `rbp`** on top of that.
* `mov rbp, rsp` makes `rbp` point to the saved old `rbp`.
* `sub rsp, 8` reserves one 8-byte local slot **below** `rbp`.

So the standard layout becomes:

```text
[rbp+8]   return address
[rbp]     saved old rbp
[rbp-8]   first local / saved arg
```

**Memory hook:** the offsets are not magic — they come directly from
`call` → `push rbp` → `mov rbp, rsp` → `sub rsp, 8`.

