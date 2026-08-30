using UnityEngine;

namespace Zmxy.Combat
{
    public readonly struct DamageInfo
    {
        public readonly int Amount;
        public readonly Vector2 Direction;

        public DamageInfo(int amount, Vector2 direction)
        {
            Amount = Mathf.Max(0, amount);
            Direction = direction;
        }
    }
}

