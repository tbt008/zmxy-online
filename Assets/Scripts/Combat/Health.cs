using System;
using UnityEngine;

namespace Zmxy.Combat
{
    public sealed class Health : MonoBehaviour
    {
        [SerializeField] private int maxHealth = 100;
        public int Current { get; private set; }
        public int Max => maxHealth;
        public bool IsDead => Current <= 0;
        public event Action<DamageInfo> Damaged;
        public event Action Died;

        private void Awake() => Current = maxHealth;

        public void ApplyDamage(DamageInfo damage)
        {
            if (IsDead) return;
            Current = Mathf.Max(0, Current - damage.Amount);
            Damaged?.Invoke(damage);
            if (Current == 0) Died?.Invoke();
        }
    }
}

