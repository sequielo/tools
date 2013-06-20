OUT_DIR = ./bin
EXECUTABLES = cl-demo print-devices cl-mul0 cl-mul0-saxpy cl-mul1 cl-mul2 cl-mul3-blocks

all: $(EXECUTABLES:%=$(OUT_DIR)/%)

ifdef OPENCL_INC
  CL_CFLAGS = -I$(OPENCL_INC)
endif

ifdef OPENCL_LIB
  CL_LDFLAGS = -L$(OPENCL_LIB)
endif

$(OUT_DIR)/print-devices: print-devices.c cl-helper.c
	gcc $^ $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -lrt -lOpenCL -o$@

$(OUT_DIR)/cl-demo: cl-demo.c cl-helper.c
	gcc $^ $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -lrt -lOpenCL -o$@

$(OUT_DIR)/cl-mul0: cl-mul0.c
	gcc $^ $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -lrt -lOpenCL -o$@

$(OUT_DIR)/cl-mul0-saxpy: cl-mul0-saxpy.c
	gcc $^ $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -lrt -lOpenCL -o$@

$(OUT_DIR)/cl-mul1: cl-mul1.c cl-helper.c
	gcc $^ $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -lrt -lOpenCL -o$@

$(OUT_DIR)/cl-mul2: cl-mul2.c cl-helper.c
	gcc $^ $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -lrt -lOpenCL -o$@

$(OUT_DIR)/cl-mul3-blocks: cl-mul3-blocks.c cl-helper.c
	gcc $^ $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -lrt -lOpenCL -o$@

clean:
	rm -f $(EXECUTABLES:%=$(OUT_DIR)/%) *.o
