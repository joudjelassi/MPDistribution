using UnityEngine;

public class CarInfoTrigger : MonoBehaviour
{
    public GameObject infoPanel;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            // Show the info panel
            infoPanel.SetActive(true);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            // Hide the info panel
            infoPanel.SetActive(false);
        }
    }
}
