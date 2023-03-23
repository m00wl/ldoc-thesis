// file: l4/pkg/uvmm/server/src/ds_mmio_mapper.h
int access(l4_addr_t pfa, /* ... */) override
{
  long res;
  l4_addr_t ls = local_start();
  // Make sure that the page is currently mapped.
  // Forward VM page fault type to pager.
  res = page_in(ls + offset, vcpu.pf_write());
  /* ... */
}
