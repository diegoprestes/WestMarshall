package com.diegoprestes.game.components {
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.builder.StageBuilder;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.screens.StartScreen;
	import org.flixel.FlxG;
	
	/**
	 * @author diegoprestes
	 */
	public class HealthComponent extends Component implements IComponent {
		public function HealthComponent() {
			super();
		}
		
		public function onUpdate():void {
		}
		
		public function onMessage(id:String, value:Object = null):void {
			var hp:Number;
			
			var data:Object = {};
			
			if (id == "applyDamage") {
				hp = owner.getNumber("hp");
				
				var damage:Number = Number(value);
				
				hp -= damage;
				
				if (hp <= 0) {
					owner.sendMessage("died");
					
					if (owner.getString("group") == "player") {
						Main.INSTANCE.changeState(new StartScreen());
					} else {
						var enemyType:String = owner.getString("type");
						cpln("ENEMY KILLED = " + enemyType);
						if (enemyType != "null" && enemyType != null) {
							var enemyKill:Number = SaveManager.getInstance().getEnemyKill(enemyType);
							enemyKill++;
							SaveManager.getInstance().setEnemyKill(enemyType, enemyKill);
							
							if (enemyKill > Main.INSTANCE.config.getNumber(enemyType + "_badge")) {
								SaveManager.getInstance().setBadge(enemyType, "true");
								
								// TODO: checar se tem badge, senao tiver mostrar popup
							}
						}
					}
					
					owner.kill();
				} else {
					owner.setValue("hp", hp);
					
					if (owner.getString("hit_sound") != "null")
						FlxG.play(AssetLibrary.getClass(owner.getString("hit_sound")));
				}
				
				data["group"] = owner.getString("group");
				data["hp"] = hp;
				
				StageBuilder.INSTANCE.messageManager.sendGlobalMessage("updateHealthBar", owner.getString("id"), data);
			} else if (id == "applyLife") {
				hp = owner.getNumber("hp");
				
				var life:Number = Number(value);
				
				hp += life;
				
				owner.setValue("hp", hp);
				
				data["group"] = owner.getString("group");
				data["hp"] = hp;
				
				StageBuilder.INSTANCE.messageManager.sendGlobalMessage("updateHealthBar", owner.getString("id"), data);
			}
		}
	}
}