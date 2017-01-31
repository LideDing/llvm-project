// RUN: llvm-mc -arch=amdgcn -show-encoding %s | FileCheck -check-prefix=SI %s
// RUN: llvm-mc -arch=amdgcn -mcpu=tonga -show-encoding %s | FileCheck -check-prefix=VI %s

exp mrt0 off, off, off, off
// SI: exp mrt0 off, off, off, off ; encoding: [0x00,0x00,0x00,0xf8,0x00,0x00,0x00,0x00]
// VI: exp mrt0 off, off, off, off ; encoding: [0x00,0x00,0x00,0xc4,0x00,0x00,0x00,0x00]

exp mrt0 off, off, off, off done
// SI: exp mrt0 off, off, off, off done ; encoding: [0x00,0x08,0x00,0xf8,0x00,0x00,0x00,0x00]
// VI: exp mrt0 off, off, off, off done ; encoding: [0x00,0x08,0x00,0xc4,0x00,0x00,0x00,0x00]

exp mrt0 v4, off, off, off done
// SI: exp mrt0 v4, off, off, off done ; encoding: [0x01,0x08,0x00,0xf8,0x04,0x00,0x00,0x00]
// VI: exp mrt0 v4, off, off, off done ; encoding: [0x01,0x08,0x00,0xc4,0x04,0x00,0x00,0x00]

exp mrt0 off, v3, off, off done
// SI: exp mrt0 off, v3, off, off done ; encoding: [0x02,0x08,0x00,0xf8,0x00,0x03,0x00,0x00]
// VI: exp mrt0 off, v3, off, off done ; encoding: [0x02,0x08,0x00,0xc4,0x00,0x03,0x00,0x00]

exp mrt0 off, off, v2, off done
// SI: exp mrt0 off, off, v2, off done ; encoding: [0x04,0x08,0x00,0xf8,0x00,0x00,0x02,0x00]
// VI: exp mrt0 off, off, v2, off done ; encoding: [0x04,0x08,0x00,0xc4,0x00,0x00,0x02,0x00]

exp mrt0 off, off, off, v1 done
// SI: exp mrt0 off, off, off, v1 done ; encoding: [0x08,0x08,0x00,0xf8,0x00,0x00,0x00,0x01]
// VI: exp mrt0 off, off, off, v1 done ; encoding: [0x08,0x08,0x00,0xc4,0x00,0x00,0x00,0x01]

exp mrt0 v4, v3, off, off done
// SI: exp mrt0 v4, v3, off, off done ; encoding: [0x03,0x08,0x00,0xf8,0x04,0x03,0x00,0x00]
// VI: exp mrt0 v4, v3, off, off done ; encoding: [0x03,0x08,0x00,0xc4,0x04,0x03,0x00,0x00]

exp mrt0 v4, off, v2, off done
// SI: exp mrt0 v4, off, v2, off done ; encoding: [0x05,0x08,0x00,0xf8,0x04,0x00,0x02,0x00]
// VI: exp mrt0 v4, off, v2, off done ; encoding: [0x05,0x08,0x00,0xc4,0x04,0x00,0x02,0x00]

exp mrt0 v4, off, off, v1
// SI: exp mrt0 v4, off, off, v1 ; encoding: [0x09,0x00,0x00,0xf8,0x04,0x00,0x00,0x01]
// VI: exp mrt0 v4, off, off, v1 ; encoding: [0x09,0x00,0x00,0xc4,0x04,0x00,0x00,0x01]

exp mrt0 v4, off, off, v1 done
// SI: exp mrt0 v4, off, off, v1 done ; encoding: [0x09,0x08,0x00,0xf8,0x04,0x00,0x00,0x01]
// VI: exp mrt0 v4, off, off, v1 done ; encoding: [0x09,0x08,0x00,0xc4,0x04,0x00,0x00,0x01]

exp mrt0 v4, v3, v2, v1
// SI: exp mrt0 v4, v3, v2, v1 ; encoding: [0x0f,0x00,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp mrt0 v4, v3, v2, v1 ; encoding: [0x0f,0x00,0x00,0xc4,0x04,0x03,0x02,0x01]

exp mrt0 v4, v3, v2, v1 done
// SI: exp mrt0 v4, v3, v2, v1 done ; encoding: [0x0f,0x08,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp mrt0 v4, v3, v2, v1 done ; encoding: [0x0f,0x08,0x00,0xc4,0x04,0x03,0x02,0x01]

exp mrt7 v1, v1, v1, v1
// SI: exp mrt7 v1, v1, v1, v1 ; encoding: [0x7f,0x00,0x00,0xf8,0x01,0x01,0x01,0x01]
// VI: exp mrt7 v1, v1, v1, v1 ; encoding: [0x7f,0x00,0x00,0xc4,0x01,0x01,0x01,0x01]

exp mrt7 v1, v1, v1, v1 done
// SI: exp mrt7 v1, v1, v1, v1 done ; encoding: [0x7f,0x08,0x00,0xf8,0x01,0x01,0x01,0x01]
// VI: exp mrt7 v1, v1, v1, v1 done ; encoding: [0x7f,0x08,0x00,0xc4,0x01,0x01,0x01,0x01]

exp mrtz v4, v3, v2, v1
// SI: exp mrtz v4, v3, v2, v1 ; encoding: [0x8f,0x00,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp mrtz v4, v3, v2, v1 ; encoding: [0x8f,0x00,0x00,0xc4,0x04,0x03,0x02,0x01]

exp mrtz v4, v3, v2, v1 done
// SI: exp mrtz v4, v3, v2, v1 done ; encoding: [0x8f,0x08,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp mrtz v4, v3, v2, v1 done ; encoding: [0x8f,0x08,0x00,0xc4,0x04,0x03,0x02,0x01]

exp null v4, v3, v2, v1
// SI: exp null v4, v3, v2, v1 ; encoding: [0x9f,0x00,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp null v4, v3, v2, v1 ; encoding: [0x9f,0x00,0x00,0xc4,0x04,0x03,0x02,0x01]

exp null v4, v3, v2, v1 done
// SI: exp null v4, v3, v2, v1 done ; encoding: [0x9f,0x08,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp null v4, v3, v2, v1 done ; encoding: [0x9f,0x08,0x00,0xc4,0x04,0x03,0x02,0x01]

exp pos0 v4, v3, v2, v1
// SI: exp pos0 v4, v3, v2, v1 ; encoding: [0xcf,0x00,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp pos0 v4, v3, v2, v1 ; encoding: [0xcf,0x00,0x00,0xc4,0x04,0x03,0x02,0x01]

exp pos0 v4, v3, v2, v1 done
// SI: exp pos0 v4, v3, v2, v1 done ; encoding: [0xcf,0x08,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp pos0 v4, v3, v2, v1 done ; encoding: [0xcf,0x08,0x00,0xc4,0x04,0x03,0x02,0x01]

exp pos3 v4, v3, v2, v1
// SI: exp pos3 v4, v3, v2, v1 ; encoding: [0xff,0x00,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp pos3 v4, v3, v2, v1 ; encoding: [0xff,0x00,0x00,0xc4,0x04,0x03,0x02,0x01]

exp pos3 v4, v3, v2, v1 done
// SI: exp pos3 v4, v3, v2, v1 done ; encoding: [0xff,0x08,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp pos3 v4, v3, v2, v1 done ; encoding: [0xff,0x08,0x00,0xc4,0x04,0x03,0x02,0x01]

exp param0 v4, v3, v2, v1
// SI: exp param0 v4, v3, v2, v1 ; encoding: [0x0f,0x02,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp param0 v4, v3, v2, v1 ; encoding: [0x0f,0x02,0x00,0xc4,0x04,0x03,0x02,0x01]

exp param0 v4, v3, v2, v1 done
// SI: exp param0 v4, v3, v2, v1 done ; encoding: [0x0f,0x0a,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp param0 v4, v3, v2, v1 done ; encoding: [0x0f,0x0a,0x00,0xc4,0x04,0x03,0x02,0x01]

exp param31 v4, v3, v2, v1
// SI: exp param31 v4, v3, v2, v1 ; encoding: [0xff,0x03,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp param31 v4, v3, v2, v1 ; encoding: [0xff,0x03,0x00,0xc4,0x04,0x03,0x02,0x01]

exp param31 v4, v3, v2, v1 done
// SI: exp param31 v4, v3, v2, v1 done ; encoding: [0xff,0x0b,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp param31 v4, v3, v2, v1 done ; encoding: [0xff,0x0b,0x00,0xc4,0x04,0x03,0x02,0x01]

exp mrt0 v4, v3, v2, v1 vm
// SI: exp mrt0 v4, v3, v2, v1 vm ; encoding: [0x0f,0x10,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp mrt0 v4, v3, v2, v1 vm ; encoding: [0x0f,0x10,0x00,0xc4,0x04,0x03,0x02,0x01]

exp mrt0 v4, v3, v2, v1 done vm
// SI: exp mrt0 v4, v3, v2, v1 done vm ; encoding: [0x0f,0x18,0x00,0xf8,0x04,0x03,0x02,0x01]
// VI: exp mrt0 v4, v3, v2, v1 done vm ; encoding: [0x0f,0x18,0x00,0xc4,0x04,0x03,0x02,0x01]
