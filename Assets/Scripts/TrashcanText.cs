using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI; 

public class TrashcanText : MonoBehaviour
{
    public GameObject UiObject;
    public GameObject cube;
    void Start()
    {
        UiObject.SetActive(false);
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player")
        {
            UiObject.SetActive(true);
        }
    }
    // Update is called once per frame
    void Update()
    {
        
    }
    void OnnTriggerExit(Collider other)
    {
        UiObject?.SetActive(false);
        Destroy(cube);
    }
}
