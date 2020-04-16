package com.diegoprestes.game.components {
	import com.diegoprestes.game.builder.StageBuilder;
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.GameObjectVars;

	/**
	 * @author diegoprestes
	 */
	public class ItemComponent extends Component implements IComponent {
		public function ItemComponent() {
			super();
		}
		
		public function onUpdate():void {
		}
		
		public function onMessage(id:String, value:Object = null):void {
			if (id == GameObjectVars.OVERLAP) {
				cpln("item got = " + owner.getString("luck"));
				
				if (owner.getNumber("luck") < Main.INSTANCE.config.getNumber("rare_item_limit")) {
					cpln("GOT RARE ITEM");
					
					// TODO: checar se tem badge, senao tiver mostrar popup
					
					SaveManager.getInstance().setRareItem("true");
				}
				
				if (owner.getString("type") == "money") {
					cpln("ADD MONEY: " + owner.getValue("money"));
					
					SaveManager.getInstance().addMoney(owner.getNumber("money"));
					
					StageBuilder.INSTANCE.messageManager.sendGlobalMessage("moneyChanged", "", {});
				} else {
					// TODO: implement other items got action
				}
				
				owner.kill();
			}
		}
	}
}