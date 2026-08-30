using UnityEngine;

namespace Zmxy.Player
{
    [RequireComponent(typeof(Rigidbody2D))]
    public sealed class PlayerController2D : MonoBehaviour
    {
        [SerializeField] private float moveSpeed = 6f;
        [SerializeField] private float jumpForce = 10f;
        [SerializeField] private Transform groundCheck;
        [SerializeField] private LayerMask groundLayers;
        private Rigidbody2D body;

        private void Awake() => body = GetComponent<Rigidbody2D>();

        private void Update()
        {
            float input = Input.GetAxisRaw("Horizontal");
            body.velocity = new Vector2(input * moveSpeed, body.velocity.y);
            if (Input.GetButtonDown("Jump") && IsGrounded())
                body.velocity = new Vector2(body.velocity.x, jumpForce);
        }

        private bool IsGrounded() => groundCheck != null &&
            Physics2D.OverlapCircle(groundCheck.position, 0.12f, groundLayers) != null;
    }
}

