package org.assetloader.loaders
{

import flash.utils.Dictionary;

import org.assetloader.base.AssetType;
import org.assetloader.parsers.PropertiesParser;
import org.assetloader.signals.LoaderSignal;

	import flash.net.URLRequest;

	/**
	 * @author Sargis Sargsyan
	 */
	public class PropertiesLoader extends TextLoader
	{
		/**
		 * @private
		 */
		protected var _dictionaryObject : Dictionary;

		public function PropertiesLoader(request : URLRequest, id : String = null)
		{
			super(request, id);
			_type = AssetType.PROPERTIES;
		}

		/**
		 * @private
		 */
		override protected function initSignals() : void
		{
			super.initSignals();
			_onComplete = new LoaderSignal(Dictionary);
		}

		/**
		 * @private
		 */
		override public function destroy() : void
		{
			super.destroy();
			_dictionaryObject = null;
		}

		/**
		 * @private
		 *
		 * @inheritDoc
		 */
		override protected function testData(data : String) : String
		{
            var propertiesParser:PropertiesParser = new PropertiesParser();
			var errMsg : String = "";
			try
			{
				_data = _dictionaryObject = propertiesParser.parse(data);
			}
			catch(err : Error)
			{
				errMsg = err.message;
			}

			return errMsg;
		}

		/**
		 * Gets the resulting Properties Object after loading and parsing is complete.
		 *
		 * @return Object
		 */
		public function get dictionaryObject() : Dictionary
		{
			return _dictionaryObject;
		}
	}
}
