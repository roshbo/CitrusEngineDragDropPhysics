package
{
	
	
	public class Util
	{
		
		public static function degreesToRadians(degrees:Number):Number 
		{
			return degrees * Math.PI / 180;
		}
		
		public static function radiansToDegrees(radians:Number):Number
		{
			return radians * 180 / Math.PI;
		}
		
		public static function randomNumber(min:Number, max:Number):Number
		{
			return Math.random() * (max - min) + min;
		}
		
		public static function randomInt(min:int, max:int):int
		{
			return Math.floor( min + ( Math.random() * ( max - min + 1 ) ) );
		}
		
	}
}