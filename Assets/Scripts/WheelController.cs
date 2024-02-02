using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WheelController : MonoBehaviour
{
    [SerializeField] WheelCollider frontRight;
    [SerializeField] WheelCollider frontLeft;
    [SerializeField] WheelCollider backRight;
    [SerializeField] WheelCollider backLeft;

    [SerializeField] Transform frontRightTransform;
    [SerializeField] Transform frontLeftTransform;
    [SerializeField] Transform backRightTransform;
    [SerializeField] Transform backLeftTransform;

    public float targetSpeed = 300f;
    public float acceleration = 1000f;
    public float breakingForce = 300f;
    public float maxTurnAngle = 15f;

    private float currentAcceleration = 0f;
    private float currentBreakForce = 0f;
    private float currentTurnAngle = 0f;

    private void FixedUpdate()
    {

        //Calculate current speed
        float currentSpeed = frontRight.rpm * (2 * Mathf.PI * frontRight.radius) / 60;

        // Adjust acceleration based on the difference between current and target speed
        currentAcceleration = currentSpeed < targetSpeed? acceleration: 0f;

        // Apply acceleration to front wheels
        frontRight.motorTorque = currentAcceleration;
        frontLeft.motorTorque = currentAcceleration;

        // Take care of the steering (keep it straight)
        currentTurnAngle = 0f;
        frontLeft.steerAngle = currentTurnAngle;
        frontRight.steerAngle = currentTurnAngle;

        // Update wheel meshes
        UpdateWheel(frontLeft, frontLeftTransform);
        UpdateWheel(frontRight, frontRightTransform);
        UpdateWheel(backLeft, backLeftTransform);
        UpdateWheel(backRight, backRightTransform);
    }

    void UpdateWheel(WheelCollider col, Transform trans)
    {
        // Get wheel collider state 
        Vector3 position;
        Quaternion rotation;
        col.GetWorldPose(out position, out rotation);

        // Set wheel transform state
        trans.position = position;
        trans.rotation = rotation;
    }
}
