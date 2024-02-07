using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using TMPro;
using UnityEngine;

public class TextPanelInteractor : MonoBehaviour
{

    
    [Tooltip("Place your model prefab here, and then click on the generate button!")] 
    public GameObject Model;
    
    [SerializeField]
    [Range(1, 40)] private float range = 5;
    [SerializeField] private string title;
    [SerializeField] [TextArea]private string content;
    [SerializeField] private GameObject textPanel;

    private SphereCollider sphereCollider;

    private void OnEnable() 
    {
        sphereCollider = GetComponent<SphereCollider>();
        textPanel.SetActive(false);
        UpdateText();
    }

    private void OnValidate()
    {
        if (sphereCollider == null) sphereCollider = GetComponent<SphereCollider>();
        sphereCollider.radius = range;
    }

    public void UpdateText()
    {
        if (textPanel == null)
        {
            textPanel = transform.GetChild(0).gameObject;
        }
        textPanel.transform.GetChild(1).GetComponent<TextMeshProUGUI>().text = title;
        textPanel.transform.GetChild(2).GetComponent<TextMeshProUGUI>().text = content;
    }

    private void OnTriggerEnter(Collider other)
    {
        textPanel.SetActive(true);
    }

    private void OnTriggerExit(Collider other)
    {
        textPanel.SetActive(false);
    }
}
