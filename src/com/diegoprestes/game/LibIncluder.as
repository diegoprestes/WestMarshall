package com.diegoprestes.game {

	import com.diegoprestes.game.components.ai.EnemyWeaponComponent;
	import com.diegoprestes.game.components.ai.TrackingComponent;
	import com.diegoprestes.game.components.ai.StateMachineComponent;
	import com.diegoprestes.game.components.ai.WalkComponent;
	import com.diegoprestes.game.components.EndComponent;
	import com.diegoprestes.game.components.ItemComponent;
	import com.diegoprestes.game.components.DropComponent;
	import com.diegoprestes.game.components.hud.CharacterDataComponent;
	import com.diegoprestes.game.components.hud.StageNameComponent;
	import com.diegoprestes.game.components.hud.GunDataComponent;
	import com.diegoprestes.game.components.HealthComponent;
	import com.diegoprestes.game.components.CollisionComponent;
	import com.diegoprestes.game.components.JumpComponent;
	import com.diegoprestes.game.components.KeyboardComponent;
	import com.diegoprestes.game.components.PhysicsComponent;
	import com.diegoprestes.game.components.GraphicComponent;
	import com.diegoprestes.game.components.WeaponComponent;
	import com.diegoprestes.game.screens.episodes.Episode3Screen;
	import com.diegoprestes.game.screens.episodes.Episode2Screen;
	import com.diegoprestes.game.screens.episodes.Episode1Screen;
	import com.diegoprestes.game.screens.StoreScreen;
	import com.diegoprestes.game.screens.HistoryScreen;
	import com.diegoprestes.game.screens.ControlsScreen;
	import com.diegoprestes.game.screens.AchievementsScreen;
	import com.diegoprestes.game.screens.stage.StageScreen;
	import com.diegoprestes.game.screens.StartScreen;
	
	/**
	 * @author diegoprestes
	 */
	public class LibIncluder {
		
		public function LibIncluder() {
			PhysicsComponent;
			CollisionComponent;
			KeyboardComponent;
			JumpComponent;
			GraphicComponent;
			WeaponComponent;
			HealthComponent;
			DropComponent;
			ItemComponent;
			EndComponent;
			
			WalkComponent;
			StateMachineComponent;
			TrackingComponent;
			EnemyWeaponComponent;
			
			CharacterDataComponent;
			GunDataComponent;
			StageNameComponent;
			
			AchievementsScreen;
			ControlsScreen;
			HistoryScreen;
			StageScreen;
			StartScreen;
			StoreScreen;
			
			Episode1Screen;
			Episode2Screen;
			Episode3Screen;
		}
	}
}