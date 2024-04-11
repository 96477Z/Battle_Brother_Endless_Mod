WorldTownScreenHireDialogModule.prototype.updateDetailsPanel = function(_element)
{
    if (_element !== null && _element.length > 0)
    {
        var currentMoney = this.mAssets.getValues().Money;
        var data = _element.data('entry');
        var initialMoneyCost = data['InitialMoneyCost'];
        var tryoutMoneyCost = data['TryoutCost'];

        this.mDetailsPanel.CharacterImage.attr('src', Path.PROCEDURAL + data['ImagePath']);

        // retarded JS calls load callback after a significant delay only - so we call this here manually to position/resize an image that is completely loaded already anyway
        this.mDetailsPanel.CharacterImage.centerImageWithinParent(0, 0, 1.0);
        if(data['IsTryoutDone'])
        {
            this.mDetailsPanel.CharacterName.html(data['tryoutName']);
        }
        else
        {
            this.mDetailsPanel.CharacterName.html(data['Name']);
        }
        this.mDetailsPanel.CharacterBackgroundImage.attr('src', Path.GFX + data['BackgroundImagePath']);
        this.mDetailsPanel.CharacterBackgroundTextScrollContainer.html(data['BackgroundText']);
        this.mDetailsPanel.InitialMoneyCostsText.html(Helper.numberWithCommas(data['InitialMoneyCost']));
        this.mDetailsPanel.DailyMoneyCostsText.html(Helper.numberWithCommas(data['DailyMoneyCost']));
        this.mDetailsPanel.TryoutMoneyCostsText.html(Helper.numberWithCommas(data['TryoutCost']));
        //this.mDetailsPanel.DailyFoodCostsText.html(Helper.numberWithCommas(data['DailyFoodCost']));

        this.mDetailsPanel.CharacterTraitsContainer.empty();

        if(data['IsTryoutDone'])
        {
            for(var i = 0; i < data.Traits.length; ++i)
            {
                var icon = $('<img src="' + Path.GFX + data.Traits[i].icon + '"/>');
                icon.bindTooltip({ contentType: 'status-effect', entityId: data.ID, statusEffectId: data.Traits[i].id });
                this.mDetailsPanel.CharacterTraitsContainer.append(icon);
            }
            this.mDetailsPanel.CharacterBackgroundTextScrollContainer.prepend($('<br/><br/><br/>'));
            this.mDetailsPanel.CharacterTraitsContainer.append($('<br/>'));
            for(var i = 0; i < data.Talents.length; ++i)
            {
                var stars = $('<img></img>');
                stars.attr('src', Path.GFX + 'ui/icons/talent_' + data.Talents[i].value.toString() + '.png');
                stars.css({ 'width': '3.6rem', 'height': '1.8rem', 'margin-bottom': '1.5rem'});
                var icon = "";
                var tooltipId = null;
                var text = "";
                var value = "";
                text += $('<span class="text-font-small font-color-assets-positive-value"></span>');
                switch (data.Talents[i].talent)
                {
                    case "HP":
                        icon = Asset.ICON_HEALTH;
                        tooltipId = TooltipIdentifier.CharacterStats.Hitpoints;
                        value.append(data.hitpoints);
                        break;
                    case "FAT":
                        icon = Asset.ICON_FATIGUE;
                        tooltipId = TooltipIdentifier.CharacterStats.Fatigue;
                        value.append(data.fatigue);
                        break;
                    case "RES":
                        icon = Asset.ICON_BRAVERY;
                        tooltipId = TooltipIdentifier.CharacterStats.Bravery;
                        value.append(data.bravery);
                        break;
                    case "INIT":
                        icon = Asset.ICON_INITIATIVE;
                        tooltipId = TooltipIdentifier.CharacterStats.Initiative;
                        value.append(data.initiative);
                        break;
                    case "MA":
                        icon = Asset.ICON_MELEE_SKILL;
                        tooltipId = TooltipIdentifier.CharacterStats.MeleeSkill;
                        value.append(data.meleeSkill);
                        break;
                    case "MD":
                        icon = Asset.ICON_MELEE_DEFENCE;
                        tooltipId = TooltipIdentifier.CharacterStats.MeleeDefense;
                        value.append(data.meleeDefense);
                        break;
                    case "RA":
                        icon = Asset.ICON_RANGE_SKILL;
                        tooltipId = TooltipIdentifier.CharacterStats.RangeSkill;
                        value.append(data.rangeSkill);
                        break;
                    case "RD":
                        icon = Asset.ICON_RANGE_DEFENCE;
                        tooltipId = TooltipIdentifier.CharacterStats.RangeDefense;
                        value.append(data.rangeDefense);
                        break;
                }
                var img = $('<img src="' + Path.GFX + icon + '"/>');
                img.bindTooltip({ contentType: 'ui-element', elementId: tooltipId });
               // img.css({ 'width': '3.6rem', 'height': '1.8rem' });
               // + data.Talents[i].talent + '
                var text = $('<span class="text-font-small font-color-assets-positive-value"></span>');
                text.append(img);
                text.append(stars);
                text.append("(" + value + ")");
                this.mDetailsPanel.CharacterTraitsContainer.append(text);
            }
        }
        else
        {
            var icon = $('<img src="' + Path.GFX + Asset.ICON_UNKNOWN_TRAITS + '"/>');
            icon.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldTownScreen.HireDialogModule.UnknownTraits });
            this.mDetailsPanel.CharacterTraitsContainer.append(icon);
        }

        // bin tooltips
        this.mDetailsPanel.CharacterBackgroundImage.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.CharacterBackgrounds.Generic, elementOwner: TooltipIdentifier.ElementOwner.HireScreen, entityId: data.ID });

        // special cases for not enough resources
        if(currentMoney < initialMoneyCost)
        {
            this.mDetailsPanel.InitialMoneyCostsText.removeClass('font-color-description').addClass('font-color-assets-negative-value');
            this.mDetailsPanel.HireButton.enableButton(false);
        }
        else
        {
            this.mDetailsPanel.HireButton.enableButton(true);
            this.mDetailsPanel.InitialMoneyCostsText.removeClass('font-color-assets-negative-value').addClass('font-color-description');
        }

        if(currentMoney < tryoutMoneyCost)
        {
            this.mDetailsPanel.TryoutMoneyCostsText.removeClass('font-color-description').addClass('font-color-assets-negative-value');
            this.mDetailsPanel.TryoutButton.enableButton(false);
        }
        else
        {
            this.mDetailsPanel.TryoutButton.enableButton(true);
            this.mDetailsPanel.TryoutMoneyCostsText.removeClass('font-color-assets-negative-value').addClass('font-color-description');
        }

        if(data['IsTryoutDone'])
        {
            this.mDetailsPanel.TryoutButton.removeClass('display-block').addClass('display-none');
            this.dismissButtonLayout.show();
            this.mDetailsPanel.DismissButton.removeClass('display-none').addClass('display-block');
            //this.mDetailsPanel.TryoutCostsContainer.removeClass('display-block').addClass('display-none');
            this.mDetailsPanel.TryoutCostsContainer.addClass('display-block').removeClass('display-none');
            this.mDetailsPanel.DismissButton.bindTooltip({ contentType: 'ui-element', elementId: "world-town-screen.hire-dialog-module.DismissButton" });
        }
        else
        {
            this.mDetailsPanel.TryoutButton.addClass('display-block').removeClass('display-none');
            this.mDetailsPanel.TryoutCostsContainer.addClass('display-block').removeClass('display-none');
            this.mDetailsPanel.DismissButton.unbindTooltip();
            this.dismissButtonLayout.hide();
            this.mDetailsPanel.DismissButton.removeClass('display-block').addClass('display-none');
        }

        this.mDetailsPanel.Container.removeClass('display-none').addClass('display-block');
    }
    else
    {
        this.mDetailsPanel.Container.removeClass('display-block').addClass('display-none');
    }
};

