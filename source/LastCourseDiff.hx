package;

import Controls;
import discord_rpc.DiscordRpc;
import flash.text.TextField;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.effects.FlxFlicker;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import haxe.Json;
import lime.app.Application;
import lime.utils.Assets;

using StringTools;
#if desktop
import Discord.DiscordClient;
#end

import flash.system.System;

class LastCourseDiff extends MusicBeatSubstate
{
	var options:Array<String> = ['Normal', 'B-Sides'];
	private var grpOptions:FlxTypedGroup<FlxText>;

	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;

	var cosotexto:Array<String> = ['idk', 'sexo'];
	var txtthing:String = Paths.txt('wea');
	var noway:FlxText;
	var noMan:FlxText;
	var splitHex:Array<String>;
	var splitName:Array<String>;
	var cambiotexto:Int = 0;

	override function create()
	{
		#if desktop
		DiscordClient.changePresence("Last Course Selection", null);
		#end
        FlxG.camera.bgColor = 0xFF00FF19;

        FlxG.camera.zoom = 0.95;
		MainMenuState.instance.lerpCamZoom = true;
		MainMenuState.instance.camZoomMulti = 0.94;
        
		FlxG.state.persistentDraw = true;

		grpOptions = new FlxTypedGroup<FlxText>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:FlxText = new FlxText(0, 0, 0, options[i], 32);
			optionText.setFormat(Paths.font("mariones.ttf"), 48, 0xFF00FF19, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			optionText.borderSize = 4; optionText.ID = i;
			optionText.screenCenter();
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);

			optionText.x -= 600+(500*i);
			FlxTween.tween(optionText, {x: optionText.x + 600+(500*i)}, .4 +(0.2*i), {ease: FlxEase.circInOut});
		}
		changeSelection();

		super.create();
	}

	override function closeSubState()
	{
		super.closeSubState();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.UP)
		{
			changeSelection(-1);
		}
		if (FlxG.keys.justPressed.DOWN)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxG.state.closeSubState();
			FlxG.mouse.visible = true;

			#if desktop
			DiscordClient.changePresence("In the Menus", null);
			#end
		}

		if (controls.ACCEPT)
		{
			for (item in grpOptions.members)
			{
				item.alpha = 0;
			}

			switch (options[curSelected])
			{
				case 'Normal':
					PlayState.SONG = Song.loadFromJson("last-course", "last-course");
					PauseSubState.tengo = "last-course";
					PlayState.campaignScore = 0;
					PlayState.campaignMisses = 0;
					PlayState.isStoryMode = false;
					LoadingState.loadAndSwitchState(new PlayState());
				case 'B-Sides':
					PlayState.SONG = Song.loadFromJson("last-course-borja", "last-course");
					PauseSubState.tengo = "last-course";
					PlayState.campaignScore = 0;
					PlayState.campaignMisses = 0;
					PlayState.isStoryMode = false;
					LoadingState.loadAndSwitchState(new PlayState());
			}
		}
	}

	function changeSelection(change:Int = 0)
	{
		curSelected = FlxMath.wrap(curSelected + change, 0, options.length-1);

		for (i=>item in grpOptions.members) {
			item.alpha = 0.4; item.color = 0xFF00FF19;
			if (item.ID == curSelected) {item.alpha = 1; item.color = 0xFF00FF19;}
		}
	}
}
