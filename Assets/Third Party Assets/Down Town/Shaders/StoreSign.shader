// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "PolyPixel/Decals"
{
	Properties
	{
		_MaskClipValue( "Mask Clip Value", Float ) = 0.5
		[HideInInspector] __dirty( "", Int ) = 1
		_BaseColor("Base Color", Color) = (1,1,1,1)
		_AlbedoMap("Albedo Map", 2D) = "white" {}
		_AlphaCutoff("Alpha Cutoff", Range( 0 , 1)) = 0
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+1" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha  
		struct Input
		{
			float2 uv_AlbedoMap;
		};

		uniform float4 _BaseColor;
		uniform sampler2D _AlbedoMap;
		uniform float _AlphaCutoff;
		uniform float _MaskClipValue = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 tex2DNode1 = tex2D( _AlbedoMap,i.uv_AlbedoMap);
			o.Albedo = ( _BaseColor * tex2DNode1 ).xyz;
			o.Alpha = 1;
			clip( ( ( tex2DNode1.a + _AlphaCutoff ) * _AlphaCutoff ) - _MaskClipValue );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=3104
39;49;1158;672;1164.001;346.5001;1.3;True;True
Node;AmplifyShaderEditor.CommentaryNode;8;-873.1999,242.7001;Float;657;355;Alpha Cutoff Settings;3;6;5;7
Node;AmplifyShaderEditor.CommentaryNode;2;-786,-303;Float;543;484;Albedo Settings;3;4;1;11
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;True;2;Float;ASEMaterialInspector;Standard;PolyPixel/Decals;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Masked;0.5;True;False;1;False;TransparentCutout;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;FLOAT3;0,0,0;FLOAT3;0,0,0;FLOAT3;0,0,0;FLOAT;0.0;FLOAT;0.0;FLOAT;0.0;FLOAT3;0,0,0;FLOAT3;0,0,0;FLOAT;0.0;OBJECT;0.0;FLOAT3;0.0,0,0;OBJECT;0.0;OBJECT;0.0;FLOAT4;0,0,0,0;FLOAT3;0,0,0
Node;AmplifyShaderEditor.SimpleAddOpNode;5;-486.2,299.7;Float;FLOAT;0.0;FLOAT;0.0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-343.2,421.7;Float;FLOAT;0.0;FLOAT;0.0
Node;AmplifyShaderEditor.RangedFloatNode;7;-830.2,487.8996;Float;Property;_AlphaCutoff;Alpha Cutoff;2;0;0;1
Node;AmplifyShaderEditor.SamplerNode;1;-761,-26;Float;Property;_AlbedoMap;Albedo Map;1;None;True;0;False;white;Auto;False;Object;-1;Auto;SAMPLER2D;;FLOAT2;0,0;FLOAT;1.0;FLOAT2;0,0;FLOAT2;0,0;FLOAT;1.0
Node;AmplifyShaderEditor.ColorNode;4;-748,-262;Float;Property;_BaseColor;Base Color;0;1,1,1,1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-442.2004,-83.90004;Float;COLOR;0,0,0,0;FLOAT4;0.0,0,0,0
WireConnection;0;0;11;0
WireConnection;0;9;6;0
WireConnection;5;0;1;4
WireConnection;5;1;7;0
WireConnection;6;0;5;0
WireConnection;6;1;7;0
WireConnection;11;0;4;0
WireConnection;11;1;1;0
ASEEND*/
//CHKSM=B30AAABE8B76E67F526476712BBE13A12D04BB65