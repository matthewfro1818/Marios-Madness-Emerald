function onCreate()


	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
			--setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '3D_NOTE' then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'texture', '3D'); --Miss has no penalties

				if downscroll then
					setPropertyFromGroup('unspawnNotes', i, 'flipY', true);
					setPropertyFromGroup('unspawnNotes', i, 'offsetY', -250);
				end


			end
	end


end

function onUpdate( elapsed )
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
			--setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '3D_NOTE' then --Doesn't let Dad/Opponent notes get ignored
				
					--setPropertyFromGroup('unspawnNotes', i, 'offsetX', -40);

				--if downscroll then
				--	setPropertyFromGroup('unspawnNotes', i, 'offsetY', -250);
				--end


			end
	end
end
function goodNoteHit(id, direction, noteType, isSustainNote)

end
function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == '3D_NOTE' then
		setProperty('health',0.04)
	end
end
