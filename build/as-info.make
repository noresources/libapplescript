# GNU Make project makefile autogenerated by Premake

ifndef config
  config=release
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),release)
  RESCOMP = windres
  TARGETDIR = ../dist/Release/bin
  TARGET = $(TARGETDIR)/as-info
  OBJDIR = obj/Release/as-info
  DEFINES +=
  INCLUDES += -I../include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -O3 -Wall -Wextra
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -O3 -Wall -Wextra
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../dist/Release/lib/libapplescript.a -framework Cocoa
  LDDEPS += ../dist/Release/lib/libapplescript.a
  ALL_LDFLAGS += $(LDFLAGS) -Wl,-x
  LINKCMD = $(CC) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug)
  RESCOMP = windres
  TARGETDIR = ../dist/Debug/bin
  TARGET = $(TARGETDIR)/as-info
  OBJDIR = obj/Debug/as-info
  DEFINES +=
  INCLUDES += -I../include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -O0 -g -Wall -Wextra
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -O0 -g -Wall -Wextra
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../dist/Debug/lib/libapplescript.a -framework Cocoa
  LDDEPS += ../dist/Debug/lib/libapplescript.a
  ALL_LDFLAGS += $(LDFLAGS)
  LINKCMD = $(CC) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/as-info.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

$(TARGET): $(GCH) ${CUSTOMFILES} $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking as-info
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

clean:
	@echo Cleaning as-info
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif
	$(SILENT) $(CC) -x c-header $(ALL_CFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/as-info.o: ../src/apps/as-info.c
	@echo $(notdir $<)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif