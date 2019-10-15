// Dependency from "backend"
extern void PrintNumber(int);

// Dependency from "user code"
extern int CallApplication(void);

// Actual framework code
void Run(void) {
  PrintNumber(CallApplication());
}
