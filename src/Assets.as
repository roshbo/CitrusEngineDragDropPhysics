package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		
		[Embed(source="../media/graphics/backgroundGame.png")]
		public static const BackgroundGame:Class;
		
		[Embed(source="../media/graphics/block01.png")]
		public static const Block01:Class;
		
		[Embed(source="../media/graphics/characters.png")]
		public static const Characters:Class;
		
		[Embed(source="../media/xml/backgroundGame.xml", mimeType="application/octet-stream")]
		public static const BackgroundGameXml:Class;
		
		[Embed(source="../media/xml/block01.xml", mimeType="application/octet-stream")]
		public static const Block01Xml:Class;
		
		[Embed(source="../media/xml/characters.xml", mimeType="application/octet-stream")]
		public static const CharactersXml:Class;
		
		private static var textureList:Dictionary = new Dictionary();
		private static var textureAtlasList:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):Texture
		{
			if (textureList[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				textureList[name] = Texture.fromBitmap(bitmap);
			}
			return textureList[name];
		}
		
		public static function getAtlas(nameTexture:String, nameAtlas:String):TextureAtlas
		{
			if (textureAtlasList[nameAtlas] == undefined)
			{
				var texture:Texture = getTexture(nameTexture);
				var xml:XML = XML(new Assets[nameAtlas]());
				textureAtlasList[nameAtlas] = new TextureAtlas(texture, xml);
			}
			return textureAtlasList[nameAtlas];
		}
			
	}
}