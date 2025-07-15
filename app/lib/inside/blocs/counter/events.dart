sealed class Counter_Event {
  const Counter_Event();
}

class Counter_Initialize extends Counter_Event {
  const Counter_Initialize();
}

class Counter_Increment extends Counter_Event {
  const Counter_Increment();
}

class Counter_Decrement extends Counter_Event {
  const Counter_Decrement();
}

class Counter_Reset extends Counter_Event {
  const Counter_Reset();
}
