using System;
using UnityEngine;

namespace JSI
{
    /// <summary>
    /// Legacy handler name used by existing IVA props. This now delegates to the
    /// full-feature MechJebRPMMenu implementation.
    /// </summary>
    class MechJebRPM : MechJebRPMMenu
    {
        // Legacy color fields kept for backward compatibility with existing props.
        [KSPField]
        public string itemColor = string.Empty;
        [KSPField]
        public string selectedColor = string.Empty;
        [KSPField]
        public string unavailableColor = string.Empty;
        [KSPField]
        public float forceRollStep = 90.0f;

        // Legacy button handler name used by older configs.
        public void ClickProcessor(int buttonID)
        {
            ButtonProcessor(buttonID);
        }
    }
}
