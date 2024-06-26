-- How to use:
-- 0. Get assimp from https://github.com/assimp/assimp
-- 1. Place this file next to the cloned assimp repository like this:
--
--       assimp.lua
--       assimp/
--
-- 2. Set up configuration headers
--
--     2.1 Create a folder for configuration headers, I usually name it _config_headers/
--
--          _config_headers/assimp/     <- config.h will be included as "assimp/config.h" so the assimp/ part is important
--          assimp.lua
--          assimp
--
--     2.2 Generate config.h and revision.h from assimp/code/config.h.in and assimp/revision.h.in and put them into _config_headers/assimp. (You can also just edit and rename them, that's what I usually end up doing.)
--
--          _config_headers/
--            assimp/
--              config.h
--              revision.h
--          assimp.lua
--          assimp
--
-- 3. Edit the 'files { ... }' and 'defines { ... }' depending on which importers/exporters you need. By default I enabled COLLADA, OBJ, FBX and ASSBIN (assimp binary, good for caching)

project '*'
	includedirs {
		'_config_headers/',
		'_config_headers/assimp/', -- Location of assimp's config.h, for a template see include/assimp/config.h.in
		'%{wks.location}/vendors/assimp/include/',
	}
project 'assimp'
	kind 'StaticLib'
	language "C++"
	staticruntime "off"
	warnings 'Off'
	optimize 'Speed'
	
	targetdir "%{wks.location}/build/bin/%{cfg.architecture}-%{cfg.buildcfg}/"
    objdir "%{wks.location}/build/obj/%{cfg.architecture}-%{cfg.buildcfg}/"

	includedirs {
		'_config_headers/',
		'_config_headers/assimp/',
		'%{wks.location}/vendors/assimp/',
		'%{wks.location}/vendors/assimp/contrib/',
		'%{wks.location}/vendors/assimp/contrib/irrXML/',
		'%{wks.location}/vendors/assimp/contrib/unzip/',
		'%{wks.location}/vendors/assimp/contrib/rapidjson/include/',
		'%{wks.location}/vendors/assimp/contrib/pugixml/src/',
		'%{wks.location}/vendors/assimp/contrib/zlib/',
		'%{wks.location}/vendors/assimp/contrib/utf8cpp/source',
		'%{wks.location}/vendors/assimp/code',
		'%{wks.location}/vendors/assimp/include',
	}
	files {
		-- Dependencies
		'%{wks.location}/vendors/assimp/contrib/unzip/**',
		'%{wks.location}/vendors/assimp/contrib/irrXML/**',
		'%{wks.location}/vendors/assimp/contrib/zlib/*',
		-- Common
		'%{wks.location}/vendors/assimp/code/Common/**',
		'%{wks.location}/vendors/assimp/code/PostProcessing/**',
		'%{wks.location}/vendors/assimp/code/Material/**',
		'%{wks.location}/vendors/assimp/code/CApi/**',
		'%{wks.location}/vendors/assimp/code/Geometry/**',
		-- Importers
		'%{wks.location}/vendors/assimp/code/AssetLib/IQM/**',
		'%{wks.location}/vendors/assimp/code/AssetLib/Assbin/**',

		'%{wks.location}/vendors/assimp/code/AssetLib/Collada/**',
		'%{wks.location}/vendors/assimp/code/AssetLib/Obj/**',
		-- 'assimp/code/AssetLib/Blender/**', 'assimp/contrib/poly2tri/poly2tri/**',
		'%{wks.location}/vendors/assimp/code/AssetLib/FBX/**',
		-- 'assimp/code/glTF2/**',
		-- 'assimp/code/glTF/**',
		'%{wks.location}/vendors/assimp/code/Assbin/**' -- Very fast format to parse/write, useful for caching
	}
	-- Importers
	defines {
		'ASSIMP_BUILD_NO_3D_IMPORTER',
		'ASSIMP_BUILD_NO_3DS_IMPORTER',
		'ASSIMP_BUILD_NO_3MF_IMPORTER',
		'ASSIMP_BUILD_NO_AC_IMPORTER',
		'ASSIMP_BUILD_NO_AMF_IMPORTER',
		'ASSIMP_BUILD_NO_ASE_IMPORTER',
	    'ASSIMP_BUILD_NO_ASSBIN_IMPORTER',
		'ASSIMP_BUILD_NO_B3D_IMPORTER',
		'ASSIMP_BUILD_NO_BLEND_IMPORTER',
		'ASSIMP_BUILD_NO_BVH_IMPORTER',
		'ASSIMP_BUILD_NO_C4D_IMPORTER',
		'ASSIMP_BUILD_NO_COB_IMPORTER',
		'ASSIMP_BUILD_NO_COLLADA_IMPORTER',
		'ASSIMP_BUILD_NO_CSM_IMPORTER',
		'ASSIMP_BUILD_NO_DXF_IMPORTER',
		-- 'ASSIMP_BUILD_NO_FBX_IMPORTER',
		'ASSIMP_BUILD_NO_GLTF_IMPORTER',
		'ASSIMP_BUILD_NO_HMP_IMPORTER',
		'ASSIMP_BUILD_NO_IFC_IMPORTER',
		'ASSIMP_BUILD_NO_IRR_IMPORTER',
		'ASSIMP_BUILD_NO_IRRMESH_IMPORTER',
		'ASSIMP_BUILD_NO_LWO_IMPORTER',
		'ASSIMP_BUILD_NO_LWS_IMPORTER',
		'ASSIMP_BUILD_NO_M3D_IMPORTER',
		'ASSIMP_BUILD_NO_MD2_IMPORTER',
		'ASSIMP_BUILD_NO_MD3_IMPORTER',
		'ASSIMP_BUILD_NO_MD5_IMPORTER',
		'ASSIMP_BUILD_NO_MDC_IMPORTER',
		'ASSIMP_BUILD_NO_MDL_IMPORTER',
		'ASSIMP_BUILD_NO_MMD_IMPORTER',
		'ASSIMP_BUILD_NO_MS3D_IMPORTER',
		'ASSIMP_BUILD_NO_NDO_IMPORTER',
		'ASSIMP_BUILD_NO_NFF_IMPORTER',
		-- 'ASSIMP_BUILD_NO_OBJ_IMPORTER',
		'ASSIMP_BUILD_NO_OFF_IMPORTER',
		'ASSIMP_BUILD_NO_OGRE_IMPORTER',
		'ASSIMP_BUILD_NO_OPENGEX_IMPORTER',
		'ASSIMP_BUILD_NO_PLY_IMPORTER',
		'ASSIMP_BUILD_NO_Q3BSP_IMPORTER',
		'ASSIMP_BUILD_NO_Q3D_IMPORTER',
		'ASSIMP_BUILD_NO_RAW_IMPORTER',
		'ASSIMP_BUILD_NO_SIB_IMPORTER',
		'ASSIMP_BUILD_NO_SMD_IMPORTER',
		'ASSIMP_BUILD_NO_STEP_IMPORTER',
		'ASSIMP_BUILD_NO_STL_IMPORTER',
		'ASSIMP_BUILD_NO_TERRAGEN_IMPORTER',
		'ASSIMP_BUILD_NO_X_IMPORTER',
		'ASSIMP_BUILD_NO_X3D_IMPORTER',
		'ASSIMP_BUILD_NO_XGL_IMPORTER'
	}
	-- Exporters
	defines {
		'ASSIMP_NO_EXPORT',
		'ASSIMP_BUILD_NO_COLLADA_EXPORTER',
		'ASSIMP_BUILD_NO_X_EXPORTER',
		'ASSIMP_BUILD_NO_STEP_EXPORTER',
		'ASSIMP_BUILD_NO_OBJ_EXPORTER',
		'ASSIMP_BUILD_NO_STL_EXPORTER',
		'ASSIMP_BUILD_NO_PLY_EXPORTER',
		'ASSIMP_BUILD_NO_3DS_EXPORTER',
		'ASSIMP_BUILD_NO_GLTF_EXPORTER',
		'ASSIMP_BUILD_NO_ASSBIN_EXPORTER',
		'ASSIMP_BUILD_NO_ASSXML_EXPORTER',
		'ASSIMP_BUILD_NO_X3D_EXPORTER',
		'ASSIMP_BUILD_NO_FBX_EXPORTER',
		'ASSIMP_BUILD_NO_M3D_EXPORTER',
		'ASSIMP_BUILD_NO_3MF_EXPORTER',
		'ASSIMP_BUILD_NO_ASSJSON_EXPORTER',
		'ASSIMP_BUILD_NO_PBRT_EXPORTER'
	}
	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		defines { "_ITERATOR_DEBUG_LEVEL=2", "DEBUG" }
		buildoptions { "/MDd" }
		
	filter { "system:windows"}	
		runtime "Debug"
		symbols "on"
		-- sanitize { "Address" }
		flags { "NoRuntimeChecks", "NoIncrementalLink" }
		

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"
		-- linkoptions {"/NODEFAULTLIB:MSVCRT"}
		defines { "_ITERATOR_DEBUG_LEVEL=0", "NDEBUG" }
		buildoptions { "/MD" } 