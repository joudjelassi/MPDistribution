// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "PolyPixel/StandardSimpleTint"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_EmissiveColor("Emissive Color", Color) = (1,1,1,0)
		_EmissiveStrenght("Emissive Strenght", Float) = 0
		_TintColor("Tint Color", Color) = (1,1,1,0)
		_AlbedoMap("Albedo Map", 2D) = "white" {}
		_NormalMap("Normal Map", 2D) = "bump" {}
		_NormalScale("Normal Scale", Float) = 1
		_DetailedNormalMap("Detailed Normal Map", 2D) = "bump" {}
		_DetailedNormalUV("Detailed Normal UV", Float) = 0
		_DetailedNormalAmount("Detailed Normal Amount", Float) = 1
		_CompactMap("Compact Map", 2D) = "white" {}
		_Metalic("Metalic", Range( 0 , 1)) = 1
		_Roughtness("Roughtness", Range( 0 , 2)) = 1
		_AmbientOcclusion("Ambient Occlusion", Range( 0 , 1)) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+5" }
		Cull Off
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#pragma target 5.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_NormalMap;
			float2 texcoord_0;
			float2 uv_AlbedoMap;
			float2 uv_CompactMap;
		};

		uniform float _NormalScale;
		uniform sampler2D _NormalMap;
		uniform float _DetailedNormalAmount;
		uniform sampler2D _DetailedNormalMap;
		uniform float _DetailedNormalUV;
		uniform sampler2D _AlbedoMap;
		uniform float4 _TintColor;
		uniform float4 _EmissiveColor;
		uniform float _EmissiveStrenght;
		uniform sampler2D _CompactMap;
		uniform float _Metalic;
		uniform float _Roughtness;
		uniform float _AmbientOcclusion;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			o.texcoord_0.xy = v.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Normal = ( UnpackScaleNormal( tex2D( _NormalMap,i.uv_NormalMap) ,_NormalScale ) + ( UnpackScaleNormal( tex2D( _DetailedNormalMap,( i.texcoord_0 * _DetailedNormalUV )) ,_DetailedNormalAmount ) * 1.0 ) );
			float4 tex2DNode2 = tex2D( _AlbedoMap,i.uv_AlbedoMap);
			o.Albedo = lerp( tex2DNode2 , _TintColor , tex2DNode2.a ).rgb;
			o.Emission = ( ( _EmissiveColor * _EmissiveStrenght ) * tex2DNode2 ).xyz;
			float4 tex2DNode10 = tex2D( _CompactMap,i.uv_CompactMap);
			o.Metallic = ( tex2DNode10.r * _Metalic );
			o.Smoothness = ( tex2DNode10.g * _Roughtness );
			o.Occlusion = ( tex2DNode10.b * _AmbientOcclusion );
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=3104
-1897;53;1906;1004;2530.311;306.1673;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;28;-834.5,-1067.3;Float;713;467;Emissive Settings;4;22;23;27;24
Node;AmplifyShaderEditor.CommentaryNode;21;-844.5,204.7;Float;689;593;Metalic, Roughness and AO Setup;7;13;12;11;14;10;15;16
Node;AmplifyShaderEditor.CommentaryNode;20;-2552.383,-154.6024;Float;1472.428;479.6821;Normal Settings;10;5;7;29;30;31;32;33;34;35;36
Node;AmplifyShaderEditor.CommentaryNode;19;-827.6999,-556.5;Float;637;493;Albedo Tint Settings;3;2;17;18
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;True;7;Float;ASEMaterialInspector;Standard;PolyPixel/StandardSimpleTint;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;0;False;0;0;Opaque;0.5;True;True;5;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;FLOAT3;0,0,0;FLOAT3;0,0,0;FLOAT3;0,0,0;FLOAT;0.0;FLOAT;0.0;FLOAT;0.0;FLOAT3;0,0,0;FLOAT3;0,0,0;FLOAT;0.0;OBJECT;0.0;FLOAT3;0.0,0,0;OBJECT;0.0;OBJECT;0.0;FLOAT4;0,0,0,0;FLOAT3;0,0,0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-316,682;Float;FLOAT;0.0;FLOAT;0.0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-313,514;Float;FLOAT;0.0;FLOAT;0.0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-315,387;Float;FLOAT;0.0;FLOAT;0.0
Node;AmplifyShaderEditor.RangedFloatNode;11;-741,507;Float;Property;_Metalic;Metalic;10;1;0;1
Node;AmplifyShaderEditor.RangedFloatNode;12;-741,594;Float;Property;_Roughtness;Roughtness;11;1;0;2
Node;AmplifyShaderEditor.RangedFloatNode;13;-744,694;Float;Property;_AmbientOcclusion;Ambient Occlusion;12;1;0;1
Node;AmplifyShaderEditor.LerpOp;18;-357.9,-290.1;Float;FLOAT4;0.0,0,0,0;COLOR;0.0,0,0,0;FLOAT;0.0
Node;AmplifyShaderEditor.SamplerNode;2;-803,-255;Float;Property;_AlbedoMap;Albedo Map;3;None;True;0;False;white;Auto;False;Object;-1;Auto;SAMPLER2D;;FLOAT2;0,0;FLOAT;1.0;FLOAT2;0,0;FLOAT2;0,0;FLOAT;1.0
Node;AmplifyShaderEditor.ColorNode;17;-714.9,-470.1;Float;Property;_TintColor;Tint Color;2;1,1,1,0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-485.5,-861.3;Float;COLOR;0.0,0,0,0;FLOAT;0.0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-275.5,-787.3;Float;COLOR;0.0,0,0,0;FLOAT4;0.0,0,0,0
Node;AmplifyShaderEditor.ColorNode;22;-760.5,-990.3;Float;Property;_EmissiveColor;Emissive Color;0;1,1,1,0
Node;AmplifyShaderEditor.RangedFloatNode;23;-715.5,-762.3;Float;Property;_EmissiveStrenght;Emissive Strenght;1;0;0;0
Node;AmplifyShaderEditor.SamplerNode;10;-720,263;Float;Property;_CompactMap;Compact Map;9;None;True;0;False;white;Auto;False;Object;-1;Auto;SAMPLER2D;;FLOAT2;0,0;FLOAT;1.0;FLOAT2;0,0;FLOAT2;0,0;FLOAT;1.0
Node;AmplifyShaderEditor.SamplerNode;5;-2273.621,-92.99201;Float;Property;_NormalMap;Normal Map;4;None;True;0;True;bump;Auto;True;Object;-1;Auto;SAMPLER2D;;FLOAT2;0,0;FLOAT;1.0;FLOAT2;0,0;FLOAT2;0,0;FLOAT;1.0
Node;AmplifyShaderEditor.RangedFloatNode;7;-2508.612,-65.50423;Float;Property;_NormalScale;Normal Scale;5;1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;29;-2503.891,68.86478;Float;0;-1;FLOAT2;1,1;FLOAT2;0,0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-2217.931,156.6479;Float;FLOAT2;0.0,0;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;32;-1812.266,58.22446;Float;Property;_DetailedNormalMap;Detailed Normal Map;6;None;True;0;True;bump;Auto;True;Object;-1;Auto;SAMPLER2D;;FLOAT2;0,0;FLOAT;1.0;FLOAT2;0,0;FLOAT2;0,0;FLOAT;1.0
Node;AmplifyShaderEditor.SimpleAddOpNode;36;-1288.226,-0.2976358;Float;FLOAT3;0,0,0;FLOAT3;0.0,0,0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-1370.689,180.5888;Float;FLOAT3;0.0,0,0;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-1664.629,243.101;Float;Constant;_Default;Default;12;1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-2074.285,232.4605;Float;Property;_DetailedNormalAmount;Detailed Normal Amount;8;1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-2489.262,216.5;Float;Property;_DetailedNormalUV;Detailed Normal UV;7;0;0;0
WireConnection;0;0;18;0
WireConnection;0;1;36;0
WireConnection;0;2;27;0
WireConnection;0;3;14;0
WireConnection;0;4;15;0
WireConnection;0;5;16;0
WireConnection;16;0;10;3
WireConnection;16;1;13;0
WireConnection;15;0;10;2
WireConnection;15;1;12;0
WireConnection;14;0;10;1
WireConnection;14;1;11;0
WireConnection;18;0;2;0
WireConnection;18;1;17;0
WireConnection;18;2;2;4
WireConnection;24;0;22;0
WireConnection;24;1;23;0
WireConnection;27;0;24;0
WireConnection;27;1;2;0
WireConnection;5;5;7;0
WireConnection;31;0;29;0
WireConnection;31;1;30;0
WireConnection;32;1;31;0
WireConnection;32;5;33;0
WireConnection;36;0;5;0
WireConnection;36;1;34;0
WireConnection;34;0;32;0
WireConnection;34;1;35;0
ASEEND*/
//CHKSM=5AA6E2E8554229DC5785AE7E348F559EC75757BD