// file: fiasco/src/kern/arm/config-arm.cpp 
EXTENSION class Config
{
public:
  enum
  {
    // Make sure that the kernel has enough memory.
    KMEM_SIZE = 64 << 20,
  };
  /* ... */
};
