package
{
	import org.flixel.*;
	public class Stats extends Object
	{
		//----------------------------------------------------------------------
		//
		//  Private properties
		//
		//----------------------------------------------------------------------
		
		private var _stats:Object = { };
		
		//----------------------------------------------------------------------
		//
		//  Constructor
		//
		//----------------------------------------------------------------------
		
		public function Stats() { super(); }
		
		//----------------------------------------------------------------------
		//
		//  Add/Remove Stats
		//
		//----------------------------------------------------------------------
		
		public function addStat(statId:String,current:Number,total:Number):void
		{
			if (this._stats[statId]) return;
			var stat:Stat = new Stat();
			stat.id = statId;
			stat.current = current;
			stat.totalUnmodified = total;
			this._stats[statId] = stat;
		}
		
		public function removeStat(statId:String):void
		{
			if (!this._stats[statId]) return;
			this._stats[statId] = null;
			delete this._stats[statId];
		}
		
		//----------------------------------------------------------------------
		//
		//  Get/Set Value (Current and Total)
		//
		//----------------------------------------------------------------------
		
		public function getStatCurrentValue(statId:String):Number
		{
			if (!this._stats[statId]) return 0;
			var stat:Stat = this._stats[statId];
			return stat.current;
		}
		
		public function setStatCurrentValue(statId:String,value:Number):void
		{
			if (!this._stats[statId]) return ;
			var stat:Stat = this._stats[statId];
			stat.current = value;
		}
		
		public function getStatTotalValueUnmodified(statId:String):Number
		{
			if (!this._stats[statId]) return 0;
			var stat:Stat = this._stats[statId];
			return stat.totalUnmodified;
		}
		
		public function setStatTotalValueUnmodified(statId:String,value:Number):void
		{
			if (!this._stats[statId]) return ;
			var stat:Stat = this._stats[statId];
			stat.totalUnmodified = value;
		}
		
		public function getStatTotalValueModified(statId:String):Number
		{
			if (!this._stats[statId]) return 0;
			var stat:Stat = this._stats[statId];
			return stat.totalModified;
		}
		
		//----------------------------------------------------------------------
		//
		//  Add/Remove Modifier
		//
		//----------------------------------------------------------------------
		
		public function addAdditionModifierToStat(
		statId:String, modifierId:String, value:Number,
		stackable:Boolean = true, priority:int = 0):void
		{
			var modifier:Modifier = new AdditionModifier();
			this.setModifierToStat(
			statId,modifier,modifierId,value,stackable,priority);
		}
		
		public function addMultiplyModifierToStat(
		statId:String, modifierId:String, value:Number,
		stackable:Boolean = true, priority:int = 0):void
		{
			var modifier:Modifier = new MultiplyModifier();
			this.setModifierToStat(
			statId,modifier,modifierId,value,stackable,priority);
		}
		
		public function removeModifierFromStat(
		statId:String, modifierId:String):void
		{
			if (!this._stats[statId]) return;
			var stat:Stat = this._stats[statId];
			stat.removeModifier(modifierId);
		}
		
		//----------------------------------------------------------------------
		//
		//  Helper Methods
		//
		//----------------------------------------------------------------------
		
		private function setModifierToStat(
		statId:String, modifier:Modifier, modifierId:String, value:Number, 
		stackable:Boolean, priority:int):void
		{
			if (!this._stats[statId]) return;
			var stat:Stat = this._stats[statId];
			modifier.id = modifierId;
			modifier.value = value;
			modifier.stackable = stackable;
			modifier.priority = priority;
			stat.addModifier(modifier);
		}
		
		public function traceStat(statId:String):void
		{
			if (!this._stats[statId]) return;
			
			trace("Current " + statId + ": " +
			this.getStatCurrentValue(statId));
			
			trace("Total " + statId + " (Unmodified): " +
			this.getStatTotalValueUnmodified(statId));
			
			trace("Total " + statId + " (Modified): " +
			this.getStatTotalValueModified(statId));
			
			trace("");
		}
		
	}
}